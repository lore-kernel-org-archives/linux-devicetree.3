Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2687F3793BA
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161805; cv=none; b=ceKQ471NN/nwbVxeu9qUVFtncKnQsb9GihyjOCYWMPXbSKYLsQ3eQIiEtp7gdbr6/MVUoCCfohmqTUcy1ChP5lqZCy3QIw8pLZ+oO4ioJWtzP2epWpmtaczFiApbWAnK8oW8XigiplF8HEpGTi+8+dVoA/NdrN18EXSYtwuKqaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161805; c=relaxed/simple;
	bh=2Kk80nisesvL8slohwKnMYjOfVBgofMCO+Yse0A2qOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OAiunWnrK24vL09q3R91Rgx+umihHQHXQdW7C+tA6s5eeh4oAjyBxc0M8+jxrG5El4jbfJZlLSLDb/e4xWC3qlxqjcSwGDZmMnGxBxHF1Fn7WIr8BzbMthdCFXws0X6D5EFPLbXgTJaQqEPwjqdMVfJcYJrwgFbWaYn1lNB1CN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYN4jRMw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PYZKOCj6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYN4jRMw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PYZKOCj6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlixY4061202
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	blnIK50OKluSsed5I4jwK/iq1A2hEgJWuOzhPzLg1jE=; b=CYN4jRMw5SOX1O5b
	BoYtp3vrSWRVbfXZ/IOd/mLI6FqnCeEv1Zw1GAIOG3TSxdtcAMOceE64TPyvqsYj
	H8zfgfkUHJbtjSXX+7Da1mGrspTpw6BpUAMnKVgkkmCeNRApPJGvKDoa4nz9WsO7
	NFdiCLfekTGtnGnxwtNJN3b+BPfNROJ3lAM1ZoIWtDw9fs5TLvFc1yZQkBIWvWh7
	qxqsd0AOPTHWStnzwnohMDTBd21X+T+h+uboLszagFZDum1VS+tn7juEyEfai0zX
	94FC/1zMgE6w0oR9InhonFEoXZd+dEyV8dH9Pr2EmiLwBgfxAw19sXi8XCyRpKLu
	fdGzfQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq140r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:16:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cf4b8ea6f1so6350865ad.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785161800; x=1785766600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blnIK50OKluSsed5I4jwK/iq1A2hEgJWuOzhPzLg1jE=;
        b=PYZKOCj6vo383n/XwtOgIk2eloG6k97vjtXcHvl+0h9OyDsoT3dNKt+27cCE3wyvM7
         m6F9ZCjmQTp287s9X2Ic+I0TzrViL5TbwDc2Zw84Vo9zTBbxJfP1gPZrSR0Wf/BM+o5p
         n27PthJasThkcLqUz8deJcDPMeITD1Ddjp9WyX81gT2H50XDIB+5AwWFfkpTpvzDevAt
         CTB1qwlbgRMG6mMk9Vhpwe1640pwgANDgLEMWanyCJbZKBJoPX3pQMy+oyZ4VpaPhSCM
         /0qNcx5Dacugttsp/BBxHmScUW0Sj7ASFZZEmwlqSAjslag/AeSUrwvADz7MSt+OA6kU
         KASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785161800; x=1785766600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blnIK50OKluSsed5I4jwK/iq1A2hEgJWuOzhPzLg1jE=;
        b=RcmqFfM30d4TLDtSlP4TpWPl5fDtN4qLwgwBS45/priN5qFN3w44q9IBF9TStzzpiu
         Ved3k6do9DVZwWz+U9+Ia+Ewl7APwSSrAaLYrCR2IaxBcs1CdV2sy1ldyo/WcFYTLO/N
         Md/FY6upYHAkP92kRz2rHNce/3WxXs+Ts/HsMxngggKbyDyRD5E+KYwjOEA4v00gUbWr
         xpQheD7UZDaj23EFlslwFSOsl2+bDUKF5OTtpvyyE/Vy1INbd13tFyktF0GnJTrGzsIb
         zPoAcgQhpOUX7X0rgPkRo2WJq0pJeGdonWAEOo1aR9l5vKgdDsoCyF9H2J0KcfsuB1ob
         N+Gg==
X-Forwarded-Encrypted: i=1; AHgh+RrVckpnoqec4iEOAzOQC9XbrybMYOxBBOdTeuo8JJbIlUVZ06hv9HwaM31OrEmjzV7oTXr1YxyuHBzE@vger.kernel.org
X-Gm-Message-State: AOJu0YxT/ZgKfedfD4Z8s2v0++HXza+J/0BW6K34NPvWLQ98P/4nrtBe
	u0rkDWthcMnPGse0ybcKwf7mhhCDiWHxKQnNlV3JvQ6GAagZzXBu/r43mCgv/7ohp5Oc8wGNvKk
	o/QIehT5gwXxdzRYMAvaqAZ2ExojlEeShmoUgCahpXxqqgxiMpOPeOyA10pt6Fqs2lU8Gwtkc
X-Gm-Gg: AR+sD12ePnXT3OKsw3teAYnBunQZccXD0Og8rQBHYnwz9YHiv9TaFhePNF2n+aUu2Jn
	b7DOlt9STXnPWu35oR7rClboWQjXRHRtkDCvUaEGMtdTafytnTSGuw3jrd7SioMPbrnBkBG0J4q
	XXm1h9XNtUhVMCNuW5dCwxC+k9ozj0Z49qMrLeCa/KsNlyOYxX9sfS+0hzeCIvwhe7mC8JGWghX
	/VsXiTmUWKNyPJO9bsBrEmwgRrQiFIJOPLpQ6/WI72SYmOW1cCka4HE4nd2g7PdUnOTEvXCWMgh
	Fk8IYcyu1TByG9WRPAk3M4rZufnHJwSlK0SryJw8XfonDGrr9x1L2ecuGyiPKt7PltSQT90bubQ
	CuGTTGyNkL8Mi0QQRpwSACyKFIrzUNyE8RR7QQS/tlqnPFtRW0dw=
X-Received: by 2002:a17:90b:1fc4:b0:38e:6a7c:abbc with SMTP id 98e67ed59e1d1-38f29625594mr10207192a91.3.1785161800040;
        Mon, 27 Jul 2026 07:16:40 -0700 (PDT)
X-Received: by 2002:a17:90b:1fc4:b0:38e:6a7c:abbc with SMTP id 98e67ed59e1d1-38f29625594mr10207133a91.3.1785161799625;
        Mon, 27 Jul 2026 07:16:39 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm88012281c88.15.2026.07.27.07.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:16:39 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 19:46:31 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: monaco: Add compatible to the PCIe
 Root Port
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-b4-monaco-evk-m2-v1-v1-1-5429cce68599@oss.qualcomm.com>
References: <20260727-b4-monaco-evk-m2-v1-v1-0-5429cce68599@oss.qualcomm.com>
In-Reply-To: <20260727-b4-monaco-evk-m2-v1-v1-0-5429cce68599@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfXyM9FM1h0oG4Z
 vCaRW0dAPumM58i8oeZ2L81oYBecKfppeXpb+mDYB6/NB3Lwrqa91vGTYnbEFnMMc1MYeo7iXo5
 DzakizNLmd/Za9Ps9q2fOrwYfmyRV2E=
X-Proofpoint-ORIG-GUID: X6pSRNlAdU0sioC9nnMEgah0pJSdUloY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfX3pyvdkQM5e99
 GgtqiQw7HkzfasOk/7YJYILsRsNCY6Md9zwabPVI28euarS3VAr3x4QIS2UuaU3s8m9jTIo0OQ/
 Cg9lQOBw+XHBK7iRBRWGNglp900jia2oi/G6Ptu+DCqCI5VM3CQQ0oBFakAhfIh9lmqXAfrnnMz
 2t4B67EFuk3X4OypvLaGebwiLMybmYp/fO0EtnRko5VmqKlpFFZJnEeJa092PgYMRm6GehvbG+4
 oB6HRJ+bQNWZN3pHUOq6jlJnqEsGUf0X2F2POOP5xM3vAUACAkWjki0hzIs1Yo5IrLcZozMfszb
 Uj/vDIeeHgI9LNVqq+kS+JXSLLNpBz10tpjkUNWK3kfkqCMpluvCS+qRGRCPQWxtq+mKajHOa8Q
 me17r5xzxzfFmTajGkcdIsbqNgE5JO0Ri+aiwzhRiJC1ddUNG99Kj/5aVaMXY3ft7/JgNwm+/Ro
 BF+gupGq2f0S+Lz6Fkw==
X-Proofpoint-GUID: X6pSRNlAdU0sioC9nnMEgah0pJSdUloY
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a676849 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=s3JIKy7HVgEvE3Gl7h0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270135

Add 'compatible = "pciclass,0604"' to the pcieport0 node in monaco.dtsi
to allow the PCI subsystem to associate the DT node with the PCI-to-PCI
bridge device. This is required for downstream DT nodes (such as M.2
connectors described as graph endpoints of the Root Port) to be matched
to PCI devices.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 64fc0d592282..438ccf6eba64 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2393,6 +2393,7 @@ opp-32000000 {
 			};
 
 			pcieport0: pcie@0 {
+				compatible = "pciclass,0604";
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1

