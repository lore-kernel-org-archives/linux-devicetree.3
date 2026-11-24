Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795562961;
	b=GvGVZPgjLFzGHA5GxdU0a2KIN4rTF5M8FQhwxThhtU4fJFD1gu+eVV0foJ7C0fs9RHxU
	 VPgnwN4w6ox2LErwCs41CmFKV+0niArajVTIwN74I/21ivGcWYexrKT/6y9rlfc5V0emM
	 7kyn8ifq0CmVfm9HjIgrvwBHGaUsSBoaaO1p1O9z+UP+xG+9aatSwDVVNo5XbGQcD4K+s
	 U9a24rXnT236FbXCJr59NMa/0SoQazIdZdqtnwX85XZL6YsKLdAEies1DiXPTfuHUUP0R
	 s8foj+pNy2V1PSgpF7IDG9y04Zxn7fS8t1D5Lif4Fim4FyL/r3YRX7Kvpu29rxWo/vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562961;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e1lxRe10abA5xf/LAQ3bpT+O85OTy/y70gwLv9Xlw0A=;
	b=IC5p3ak+5dkjD1mWmv7uv3hbWwdLU4YCfDEwGy5qV8oivZcxk/VRcSppX3akV2ZXG68M
	 rsjR1yHa1TN7yDf4mwfg1NHWFTQpO6Jp911seXfi9DCaKcnsDZhSO51lEn324JJqT1yG1
	 83teyZoMAZENabSvH6UifEw1JgyZDkgjT+ow6jPfOoknXqy71L2DbJHHQ4waQ+QBoAZRI
	 XyHbcOJSm9QMYJ9MxE7ylq07XhWjTu3v9hULOfg4lTdnCJIPdt8XM1qaJM5SnWNl5LpU/
	 22KaWcAiw1DCm7uZYaNmlCp663Kjcw7K4LdaP3ndvrQWfoHfClz4H88QRcRmtksEkNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EqKyVmR8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B7pdEJGb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0722606A323
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 23:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0722606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EqKyVmR8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B7pdEJGb
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMbLeI031620
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 23:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e1lxRe10abA5xf/LAQ3bpT
	+O85OTy/y70gwLv9Xlw0A=; b=EqKyVmR8mWLgwR0n1cuvccu+7GWFQEKPapmLxw
	CC3fL7XUXDD4lP1zz2iB2pE2oQkx0hXxbC7ptKSjAdjQcICQJpqKwdQOhA+0s7KH
	ewVZfWwIgTtDgFCk6JaCWDxR5eAB84nV28bprF/roxICmXv02/agslq+i5D8ct28
	MAu6KgFz9xpYrNhn7pKMMS6S9CFosDqnijhYByvLiBAlTu768zjt7iHd6UdgyTTJ
	eIsZGlAMS7AMjEvyYfutLwFL2Ly0DjR+P01tyaiTGKPXmBSwXlnhFLcVXFQCfNx4
	FKzzaIqTrZbayXXlLGhiGtuIXyDkFU4Rlk94wlqkn0DAFX5Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5ad7tr3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 23:29:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so8007360eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 15:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795562959; x=1796167759; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e1lxRe10abA5xf/LAQ3bpT+O85OTy/y70gwLv9Xlw0A=;
        b=B7pdEJGbph7bYXQT8GoW3yqInTomc+0f03NCWzlw/9oWW8d8VSViZz6ZJxFJu5ye4e
         OorIyhTcnhV9Rfvp1voKjVy5HzokrixHGcBosVLpYUIPfDCDNrfAGdD82LcphPsKLBIO
         5FxjQy+2oRr68PyFZMsZRhTwdfFMPMK6F3DMIs8rGi6468Ev7l9L9Lnk3DPCC7osybnB
         YxWDCrEtj7mgXmjY0Z5SiHsbCtSKibffheIDbQz06wr2xuW6EpC6jDJfx6XyYGz1LkoJ
         3i5odw+pSXKehOyWWs7hZf35Ul4NLJB5joYasaQXpTewzr9Q5xspBzovpIXAhFdy2Xt/
         Stgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795562959; x=1796167759;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e1lxRe10abA5xf/LAQ3bpT+O85OTy/y70gwLv9Xlw0A=;
        b=ZQ1pxIsb1bNyhJcSYptm/+ZPcPhsaMFw26acfW4DCnNEkZAl2Tl+orwDuj61jWNftP
         eWOYuFSnsO4LKGhRSZLZqAmZwViTgGq5mDwVZOdUC2ljncLZ1V3o71OM48nxDlIlmhdz
         30GsgHexWbS8FajIFIEqGFt8D3sBnNbm+45FflE0LIzXCnQ5uvnVnSsp537Wb0OXyUud
         3Ia69gxF7oNa6dJdeauzni11pc1tN7o+Fy/0phjxA7o0UtK8kQxG4Acv5U3fWdB+D6Qm
         CbeXz1hBtSIrWu/r1pNhPKQXYsEpIIZfBuETYET6iaD1GLsKVobKmtk1/PxjvkpoQdKZ
         jccw==
X-Forwarded-Encrypted: i=1; AL+hErGUBjPZ37NScmuzqLF/BjZAYWc72nXhluUoFw6GaXwL58DdLlXJ8n90UrAcM8DUpwgjnTP8kP7Ets7a@vger.kernel.org
X-Gm-Message-State: APuU4Z/TAaPOUWavAEYgW1CqnrFtIWFgl5P01ShBDTsG9DzJ10HZ8VNS
	njkqi9qcjsb3xr2cDHUppjRPasmhnT3SRdAR9y55dystakpKexJssRL6BypVnhFDTSkr983Qmzc
	25OIKmCpZpk1WPsnTxA5wgUsbCr+/pyuTp/Cm2jj+yEkFkQl51pG2Npj/1bePg7cP
X-Gm-Gg: AZFdTZejlrOiAyDiHjFUe33jvfOvtX09+FpqR8R537YZXUKk5JkrTI0XUCIktuWehZw
	d7oJJJ0V+Z+mJVy08WHkkQhvxQtHeedDiwnXdzV4Yhn8jtmIUriwgNxVHF/FKr3/1Och+jiM8M5
	0YbjurHzcam+wIFEqFecT+Bflu72aEJ82j0Dau+uxp/x7Hl+jy3klttTDOdCb8xtzK7pWTj2uca
	qSVEm+sqypPU4OjoRP9Ztmbw8nqAIefXCGG5axXLXstiihULDzSt67AiG4xGfzoQu70NrYNm1J4
	4dD/NkJPTz+7Td8/YHH7qyDPbcP9gwXRu5sVJYHQFLLVDoEkSt+AxZkGYiUMyUe7J2KDJzkUm/+
	bCfAGm44D42gWEcgkkYsW73e03K+P7OKFmM/y6Qa3jiH1Cl4MSz7JT6HNpg==
X-Received: by 2002:a05:7301:d816:10b0:386:aa60:d560 with SMTP id 5a478bee46e88-386aa60de28mr9130013eec.8.1795562958575;
        Tue, 24 Nov 2026 15:29:18 -0800 (PST)
X-Received: by 2002:a05:7301:d816:10b0:386:aa60:d560 with SMTP id 5a478bee46e88-386aa60de28mr9129971eec.8.1795562957877;
        Tue, 24 Nov 2026 15:29:17 -0800 (PST)
Received: from [10.213.99.236] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm59500948eec.4.2026.11.24.15.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:29:17 -0800 (PST)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 04:58:42 +0530
Subject: [PATCH] arm64: dts: qcom: nord: use "hpass" label for adsp fastrpc
 node
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-nord-label-change-v1-1-0d6292feddcc@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKkdBmsC/y3MywqAIBCF4VeJWSekkFSvEi1Sp5oQDa0IonfPL
 ssPzvlPiBgIIzTZCQF3iuRdAs8z0FPvRmRkkkEUQnIuSuZ8MMz2Ci37B6asRaVkZXQtIf2WgAM
 db7PtPsdNzajXJwTXdQN3HxJ+dQAAAA==
X-Change-ID: 20261125-nord-label-change-d5928b68dc96
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, srini@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MiBTYWx0ZWRfX8Lg/84X0m9yY
 r87VqUNQGiMC7tmwxujbMsD0/Wlc6+HkJKpb2PhVJJZ8W0ZgL1CUPFebOB1LWAE5/Ag7ITLaEV2
 rFvuYSbR726bwq5lsoBz57drIweMj5s=
X-Authority-Analysis: v=2.4 cv=cI51IVeN c=1 sm=1 tr=0 ts=6b061dcf cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=R4NXOgOAahvwYYLiyYoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MiBTYWx0ZWRfXxXkWFuZI161P
 0XVdk4PUnJhia+6NlxBhkskyCFrHM0J5GEQXNcvXNYk1w9CBBvcdyIyxqqOP49SV/YheJ+qh1t+
 +GRB+nUmE4lWQJjO1wuY/rNtxn/qVAV6LiryrlKEw2TviGrWSOrr6pT6mOomFT9ewlOy51YiRsV
 Qz79Pb/OnPYEY7F2/Lt20Qc6qJthz67iiWLwLkXhQv5ZdTLynvJCuuUiismQWpEpt4OKVffU2IW
 TWXNT/fyCQKr+xCCdcTdRdDdSf4g0MwcjowoMw8N0RkkHEpBmXPQjDUKYhn8SdBsveKaQC1rUHe
 6eLdCxzeofxUSyL/GmVlzb1TpackbrB8tf4BNNttv3AROfCA2k51CXCdNlOB4h1GuflIAvi7vkC
 of/BOWHWW5PgNANuXF5vre8LIr4Nxybrq8iV1RjJsAMpbC5HX82Ntwqfty0tAhRJLSuMojPzBJz
 NGQQbgtbYPOCZAZZO6w==
X-Proofpoint-ORIG-GUID: PPFUTGPn_XKGmgDZGTi0lCkcmM6qWCmY
X-Proofpoint-GUID: PPFUTGPn_XKGmgDZGTi0lCkcmM6qWCmY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240092

HPASS (High Performance Audio Subsystem) is a distinct hardware block
from the LPASS-class ADSP used on earlier targets, with its own
shared resources, audio interface block, and additional integrated
processing hardware such as HVX (Hexagon Vector eXtensions). Fastrpc
already distinguishes DSP domains by the "label" property
(adsp/cdsp/sdsp/gdsp0/gdsp1/...); add "hpass" as a new label value to
identify this hardware rather than overloading "adsp" for it.

Update the fastrpc node's label from "adsp" to "hpass" to reflect the
actual hardware on this target.

Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 56778dd444e4..5e15cdb2496d 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -2224,7 +2224,7 @@ fastrpc {
 					compatible = "qcom,nord-fastrpc",
 						     "qcom,kaanapali-fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
-					label = "adsp";
+					label = "hpass";
 					memory-region = <&hpass_rpc_remote_heap_mem>;
 					qcom,vmids = <QCOM_SCM_VMID_LPASS
 						      QCOM_SCM_VMID_ADSP_HEAP>;

---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261125-nord-label-change-d5928b68dc96

Best regards,
--  
Anandu Krishnan E <anandu.e@oss.qualcomm.com>

