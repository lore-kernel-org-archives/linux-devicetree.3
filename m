Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A72521202
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 18:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788547868; cv=none; b=dbp1jfsffa9LhywjkqjAZA2BN+2t6vNTKDT4Qvn6meh1LvBqImNprqWp93owPNfcicGcfltmT3Xfx1ksQpe+GqCqK2C2PmF3OilRvbA4Ddsp8d91RsvO86aNrD3aPVd/ozfjIZyEMUunv0nLCroXnOgQuLVDU26orJl31iMnCUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788547868; c=relaxed/simple;
	bh=30e2YbKW2IQajGBFGXMD8HknPCEruSPRc6XeOZuDW3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rkUb890DgZdApr7IG5Ncq6B2hOKA0BTd2zdz99zl0I1OVgSVQmX0d2XyErZQYZ0F9Fh6bhJINUwGNZs3FdXtyYs47p9JVdTMIeuDwB3JxcBiFuQ0eLXretGBttbf4uXrSWW157uelGI2mxz1U0wx781cDk0YfAwVaQa/eDDlln4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YneRItfx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kqR2aaDS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YneRItfx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kqR2aaDS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HHjMQ1151795
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 18:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vP45VXrs0CiMYOIlCFKwXFygyz7JDRV/Nax9tHjmzJo=; b=YneRItfxRbb6Or7c
	S6V6E3PeDzKSliTXRXMOgHpdn1qjGyT3vGwciC3OiJgdCy79rKKulLxaTSaxyARX
	G2QcmSuvwQlsDijp/lIYUwF4m0OA1e1uEDhIH/61mNduvQxyjLMPzz8hSWua2M78
	80Iwe7G2nO/pp2r9L4SETD2hojlZrarS7rkoUEoyUWJpXNVo+HfPddFAX7r2EvqE
	eFv9bvW9kNL8FqtB9U1tKrj26u1rienzaB5/6Bxpu9gPuxNFrCMqyF7kI9Dq6ZGq
	3Apyo7Y7D0eMMZwsDVL9vb7oZKyVtFBIOpThhBld+I+y1wxH04o6DWvcAu74el4Z
	QYziTw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg00ys6jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 18:51:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39af92138f9so2066404a91.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 11:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788547862; x=1789152662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vP45VXrs0CiMYOIlCFKwXFygyz7JDRV/Nax9tHjmzJo=;
        b=kqR2aaDSwHcAvFEe3wcX/iF5tY2gtUV0gPvSVgzOZrdxP1UvyC7rQrwAeZ8vPy2C0y
         mfGsbDw6JMYXRRA0NpK3pOpEOpsyBYJoq5OzjrW0DFFn0Xty/em6RRHBC6BfOXJTP8Jj
         CLsCdxt+9oa8e668NNu6pP+0X4BUrlnmIcQsXKTbB0bFd91EKqsFJrvBdbg+PlGNNEWf
         FKrEfzF/JfZpZCR3I1yrkk+rh5x7wrYChojNdlVNsem+VkFycNOPUm8l7O71e5RchYwg
         SRIyMTFNJJDE6DBvbbvCg4USXq4+OiFQeazUq5zeEOaGcGcvzz7rW3ttejsLo/vkv6LD
         KEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788547862; x=1789152662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vP45VXrs0CiMYOIlCFKwXFygyz7JDRV/Nax9tHjmzJo=;
        b=lacRLnOzrjfJEL6jZH5juXy2JW/fmEfZb3/rr/PyV0C/D7vpU3v0d8CrWJbDp2kE7f
         r7rvamup0PbWzL43L4bC3N6khDFq8SAoLHRxhcnEvbOogOEI0UNqKQS+t81E7gEttiaS
         yHaNZRU1ituY8On4z6+DTxR7v17vu/BnmvJHXOk+qEx4DZ89b/pWCK6r0EHtufmrI4OL
         Yz7BvuZ1RtIBg0VngbdOlxVIskSHYvEBqTYTn1e+VYfP0T2rb6tkTTKhAwpv5GMld3MV
         9TtSvDdDvRGDeda2V1Rg24KItlTCMuEIbXyfAvZqanNE5S1zGuW/fdWiP8tIW1Z1JNtw
         cg9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxcAmWDITchAauodaOWeFEJAWB1INviLICzkNon8WBwc44yxt3iHBCM4AINHZXCLgJJTJ1m3scIiZFo@vger.kernel.org
X-Gm-Message-State: AFuF++kRMSGWFN5OPp39nmlOaNpFBR8YDoDKVOkvcnrU0MlYcXZA5sIr
	Oo6f42a5v924SKsDXb7nkaxaWz7BRpb/PLw7FiyhYt7XM5ZYgRscUCRI3Z9tqRFmgepkULMw239
	XJQq9RnDZFGd7ZJghOy1Fg9bWoqHdRgTJfnVNsSxRy5Nqo9gqECSCrWUnn4AOCcyl
X-Gm-Gg: AYBFou2zp0q9aSHZDOVxY4XeZDl9lO7QGcrDAErtZEG4nbvQqg48ByC+xiHa4RiqI1E
	xptFUw1sK620GFJ5w2j/dwHZJ49qhD6+gzhrNJVRBHlpGXKsRIJv4rA57GXmVjtqxTck2HenQiP
	Okzc1TNn99Pl5F58A+YctdAvvNg/OKm8Z3nfUwU6q3GWglPqLnfl/lPcIyKNgtMEhQU33WG66I5
	Q0w6Er+GDsmfXoC8sOF5vgWlsDSsvHHHQrhEPXJdaA79UwQQAX1nu/8AbGyerL4xR1RwRaTjF6r
	tt5gJgZM8hIFl22joTZ99ELsA7Qy5+b0rQ+0VwCiffRkkifrgFDKxgY4ACSUYMNjk487iv83vJP
	jCCRwoC+pzG+dOi/kOMYcVVI3IJzBXCc=
X-Received: by 2002:a17:90b:5587:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-39b086549ccmr17687589a91.16.1788547862107;
        Fri, 04 Sep 2026 11:51:02 -0700 (PDT)
X-Received: by 2002:a17:90b:5587:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-39b086549ccmr17687529a91.16.1788547861586;
        Fri, 04 Sep 2026 11:51:01 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm8682644eec.24.2026.09.04.11.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:51:01 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 00:20:42 +0530
Subject: [PATCH 1/4] dt-bindings: clock: qcom: Add TCSR_UFS_CLKREF_EN
 definition
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-glymur-ufs-clk-changes-v1-1-cdff2c67a8c2@oss.qualcomm.com>
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=baFbluPB c=1 sm=1 tr=0 ts=6a9b1317 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=afu-3B1tbf9Pr7ydrUYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: mRdRPCr8A86AU0CjCZEyoQcwsajC33wH
X-Proofpoint-GUID: mRdRPCr8A86AU0CjCZEyoQcwsajC33wH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfXwVn57VHdZmH0
 +6eJVEaLjewd9+k2ougMtrwQY6UCMP7jY8vPXmQsHDWWNnTBYR1w9ITrO7myqtOFBbODLjzpyQx
 7SAIOn1BoiktQC5KcRJA2Ter+3zhdAqJN4tmgUnzobP0w+c6JAVPd9xOPp/WNsXz6jQOLp3dufU
 qv/8fm6uPbdG9P4wFP72r5PKmt3qPAZ1grkb4nnayNCBMVrGxHgXV73nTjq4XlYqB6XoVYpa8r+
 OtREMgwlzIiVhXV6Y8OWuP5m2rVKtXKimsRZMljbzP43ZwOLUlL88wBK0nj0EwJEt8lTqO84ONQ
 IiNm0Up2nYKNULbi/CPpkHBExW1PiJWpy22KYCKWQ+gbfFb++h1yuFuQ2gpz0/YBv7zHjs6M/Z8
 OLTVo4YK65FCP8x5qdsCvzA8P4G3lOcBRbriwtZ1cz8003d42+EOczkkJqguIWR0FNQF6heGZcj
 9GlKXaxaki4nWmWOkOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfXwpWf6rQAcoIX
 TFbZkHToMIiPDMhRiJHDO2gp3Ofz+kr4Jr+mJWJHWUTYzmjuhZT8I8LzagB3REocafb8ajJTfEd
 n7DvdtzeKKyvf9EFoTT1DaeRBfVg8mU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040172

UFS and PCIE_4 share the same clkref enable on Glymur. Hence define
TCSR_UFS_CLKREF_EN as an alias of TCSR_PCIE_4_CLKREF_EN for UFS consumers
to reference the shared clkref on Qualcomm Glymur platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,glymur-tcsr.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,glymur-tcsr.h b/include/dt-bindings/clock/qcom,glymur-tcsr.h
index 72614226b113bb60f1e430fc18e13c46c8b043d3..f338ab4454a14aa75532cd0a6a56b6bbb02f9448 100644
--- a/include/dt-bindings/clock/qcom,glymur-tcsr.h
+++ b/include/dt-bindings/clock/qcom,glymur-tcsr.h
@@ -20,5 +20,6 @@
 #define TCSR_USB3_1_CLKREF_EN					10
 #define TCSR_USB4_1_CLKREF_EN					11
 #define TCSR_USB4_2_CLKREF_EN					12
+#define TCSR_UFS_CLKREF_EN					TCSR_PCIE_4_CLKREF_EN
 
 #endif

-- 
2.34.1

