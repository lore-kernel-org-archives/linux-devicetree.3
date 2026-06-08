Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01003C13F2
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 17:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941250; cv=none; b=UjmUhtuxCP/S5twTs21K89nDFZTZOx/o2KxiAq4h4UtBxzAwBdS7SarAbEe7fNiBLniF5lPyGXxigX6C/tq1h8s+Ji6qYqduTwVyHvgD4A1Ho3ypDRLJPx41O4SwInMm4idbecwz9X2oD4cTh5Q0A3SjPFMehnxS5xvhvP+u5Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941250; c=relaxed/simple;
	bh=Sp9uCyVhZgE6V5ypRAHDAVLYx8d20YuRlOPU3GnP3Gk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sClLyZ51/mHYSWwWPZu9DuxiNlrrVLclzPc29PNA7GoU24eTQsF1mv37InR4seVQWAfu8Gj++w4k/7CD/UAJLERQh1MhhhL1W3EeiFu511GnG9KPGAwzXxUGK5kwx6duoOZHjWoYOwtxeLl+4xdFCtLYAJvZ9FL7/JR74/lTQx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FcoHVPoA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fFx8xdNU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FcoHVPoA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fFx8xdNU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFZ8L3971403
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 17:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fvv0JMgN8Ty
	Za2eRZEukzJ03DvsKQNNfZlj9HOik1Nk=; b=FcoHVPoAaHtp3MEkph1MP3eGt9+
	akc2WkZi8hOQb+5MOtUoiDev40y2mhw3CQhJL1AchabXydt+2McJW88qNcgjSyJD
	VaQjnldwbmSCFimf7V3MuSEYujaNws35AjglWKk4JUmoHfeQ4dyxfI9W1sqPbk6u
	U1j0vthFQEO27YfvFIgpFdC3UCaDECZmclDQoQun25tEZKt67USDbQwen+pkVM6R
	9i0hOiGXLFuY4nE3ViOepKvHuGTxGF+gm4P0MaCj8Ll/KjTJVRma5DLsruDPcZQf
	pntSXQtSauVeBzKaYZ2MbC9aJ3w5rzZat5NNv3var/XkGNWhX3yLWmVvySQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuptj7ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 17:54:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36b9d265308so3436924a91.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 10:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780941247; x=1781546047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvv0JMgN8TyZa2eRZEukzJ03DvsKQNNfZlj9HOik1Nk=;
        b=fFx8xdNU1G095a0tELdyAeGERwOyqb4hY8GHdTjKohnUD7TKNgs+FLIQeJphSzZCkj
         LE9peSPJ+XGMMrIYcJXvLPKoMEIQodi8ulZ2cEvaXHCsq5RKoW91rgO9W7KGnpMwvIMi
         ZxU0J14wgfuu4OKsW0QlJEc2Si0I+l2ecriHkPhFByDN3e8NNe0gsKP8WDbsFqKopRAB
         XYwfbVbd4IDdIC2MRy924X+OfvLkFeKtacWVZ9MRb6mB6KZJAJPkRCvubByl9+4UN7+e
         oMsujAyHqgtj1oHi9t82UE9U4gxdm8ySKvQk5wSkXtR9XVCc5cTeKrJIWPR+IO55HDVO
         8hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941247; x=1781546047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fvv0JMgN8TyZa2eRZEukzJ03DvsKQNNfZlj9HOik1Nk=;
        b=ZC3ihGd5P7PFAfaTQLZtJtzVhoQ1qx6Ce4RdnqMY472ctiTo+DHglImFXfWglSbIYa
         IW/7w/lKfRqPCwjIckwy9XsOAjt9UFeFsX1auWG1cEPLusskPXGtWop39aGmbb+PffWz
         CGUe/RkPT1+Cc60WRx525Cu7782igDJKmMPBVgPgnLWKmjsHEB2+PMmakfAUz0D0CcsZ
         dpF9plb6bT6aYviUG7OYlYtjCXRkiVZzgTuOSeR8WN+JHfDWn7o/gq7lk3BhHM/cJk70
         5AL6KbYGnGbFmQqEdYKX9U3fLnuY7N9qEHwhTeMRZ3SHL77Uko68M1YQSbEUyH8QPaFJ
         LO2Q==
X-Forwarded-Encrypted: i=1; AFNElJ82rqjrmFq0ZJdfPSR0g/bxqMg4gvXiTYTa6FzNX5iyeZfw3/ZCU8iWSP9zt+4Nyl199hzdP/X8fR5n@vger.kernel.org
X-Gm-Message-State: AOJu0YzwxCEDdxX+vIhAlDdFyHzkfEmuiGhtWfEUThQu2mhT3Us7xbFg
	ezZ13L2gcRmqJoylFyZkefP/9hgV9JlrhpilHJjFRDdsLVI16MevZQj5uoNximwx4FQIe3S03an
	k6NE/bzF9SyiqmEZ/RqeIWhrm4u1EyELW4KHGS9anrDRkns/fohce7vIXpzXZWQP0
X-Gm-Gg: Acq92OF1cIL61erW4CHHB1brHs3UqA5q/LzOugzxhEnvSWpP3kXh1nqxivpyBhsKHnR
	4DofWbhCyu25RfQ4d+lRNMTOwzq354ZAfxTxUR38g6s5rkd95S6Bvei3U1IOwatVL0RoHqsIVhb
	iqg/SJxe66bUEuBQotu2ByKSU4zbS0crvE/8X2CbShF11iYlARFHwSIFyAxHyZSu153GDeH5+5i
	tzoostNNEnxpIcc5jW9KR6ynZcW0KyfHOk/lnxNJRMe1+oWNb7x3D59yx0E3Y57mBXXKU6/O1ym
	nQAeZQrd+sXVCMKC9qLFDSb0UXrMuiqrKXkgWCyDI2ZnZwgiyFm3ELnd95HKSquigKWlzON1P1C
	K3un8hMlNB1Vu0iSmNzOf+VtrpBivoubL2gvzUPL8PXCNDRuPhsF8l5L/vpsSIvMoPkLO
X-Received: by 2002:a05:6a20:6f8f:b0:3b1:884a:c3d5 with SMTP id adf61e73a8af0-3b4ccf81fe3mr18972794637.24.1780941246855;
        Mon, 08 Jun 2026 10:54:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f8f:b0:3b1:884a:c3d5 with SMTP id adf61e73a8af0-3b4ccf81fe3mr18972756637.24.1780941246380;
        Mon, 08 Jun 2026 10:54:06 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4afdsm18975720a12.19.2026.06.08.10.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:54:06 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: soundwire: qcom: add qcom,swr-master-ee-val property
Date: Mon,  8 Jun 2026 23:23:44 +0530
Message-Id: <20260608175345.3118060-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uWOLPzRUjAq15cyS7SD482QyqkZxxSob
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2OCBTYWx0ZWRfX23lMWWevjSDg
 2CxNqQPFnsS7UXnmg4ns4iu1jLWi6qn9QiSuklrltOsAB0AJhhGXHZDtnhjlQb52+j/0ireRxOY
 dtICLPv5yzMPMkyD7TrGOUk2QQBixdMDU0dok1CjOhLCUxvWCnlvuvGBNUPwHe4YlP8OiAiyVlZ
 DHMf6PcG6IBM5JJOjJK78FWZnVKbTmcMHUHgXIC8PAwu+FTVhe4oEBPTmWrxeQRDE7Z5HbWLSN+
 ciji3DKi0AuAs9q6LK123LQbT9cYw0KJsFKiRuQ8wq1yvhiHKciALlOvfdjxcgXpanvTUuo1nNH
 g7sxTIs1/dOUaqBzMsDOh07r/95FPn7LrQogb92k3AoklfTXWFqNtorb2jbHmUOiVafUzHXPX7E
 9orEdZQvSapi0dfmwRv6xE256FJzQ5wlL9AMVv0MNZSkrFtkV/YjE4axC4fK8HMwBR1b2UnP4FL
 J4MR1IyC/WshLF9QeGg==
X-Authority-Analysis: v=2.4 cv=XKAAjwhE c=1 sm=1 tr=0 ts=6a2701bf cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=k36RDxEvBeizBLppCEQA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: uWOLPzRUjAq15cyS7SD482QyqkZxxSob
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080168

Add documentation for the qcom,swr-master-ee-val Device Tree property
used by Qualcomm SoundWire masters to describe the execution-environment
value for interrupt routing.

This property allows platform DTs to specify the EE value used to direct
SoundWire master interrupts to the appropriate CPU target.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/soundwire/qcom,soundwire.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 9447a2f37..5b06cc1a5 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -215,6 +215,12 @@ properties:
           maximum: 4
         - const: 0xff
 
+  qcom,swr-master-ee-val:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description:
+      Execution-environment value used to route SoundWire master
+      interrupts to CPU0 or CPU1.
+
   label:
     maxItems: 1
 
-- 
2.34.1

