Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D5536998C
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 08:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238511; cv=none; b=TEVrruyry0esOcQN3P4aTJl1XM3NKLY7kQ0cBxOwpB4xsDv7Kgpczbg029z5MTdmWyrYx5nNhy8mPTTXq35DCUieK0Q6NeiFipboik2NErxzslZr96G1+VwvSEMDZ4VD6qSnWwHmTgjHFMQBC9e6nSJx6rmGmcIHsBNkaeCzBkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238511; c=relaxed/simple;
	bh=vUUf0SFe8a51kmB8FPrJBDQ5H++K+t9n0PvwI74fWXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jN1uBk0AdmzZgbi1wi7D0yacZadjxwHdBbupc0olD1qnTLhywgxY0ozgSRAba8tG+hGx5wfLxkHejAaionm56fU3U8adUqFd0q3aZ0YolTqVBBn0qMPLHYkKoKSR6S3kxnWRpaJYt0gt+N88ag3Lx0XnuoVZw2PEJlLNWveYJxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWyX7gcW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PAn/JZkI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWyX7gcW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PAn/JZkI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6657msvd1148002
	for <devicetree@vger.kernel.org>; Sun, 5 Jul 2026 08:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4mB77oGh7s9Y0Uqowh6UFsEunZgz5Qm0N6N+M/Go50=; b=PWyX7gcWfCQdAu58
	F3T9QpQ04Xkrxc6Fjh+aetKsgundaI7nqojknAu9CE0124sk4c/XVlw5eg5wdWqh
	6KpnlnCGpvUdx/MUxSRYJuLaTbV11Dm3ri5JiPVD1ErN1T7IH0OqwCcxOPQNWpoJ
	eVPpPMQb+laaQchbR2adnAbxn3/UnUE7Ygc4iAGRCr3IhicamyKvNs+sjDa0ZQVX
	cHSPBMpOuVhAwswE7841nd/k5pymYfmSrxi+T4JiQcv1PafcexV1LzZhqiksWzyE
	ZW4hZhhBA2sEXaQWBAmQUi1BUhDeK2wv2uBuYmb0YuJmQNaqrbxCFw3BRgdVUWh3
	hl5eCQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4ste3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 08:01:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-380b630c505so2423420a91.1
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 01:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783238508; x=1783843308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4mB77oGh7s9Y0Uqowh6UFsEunZgz5Qm0N6N+M/Go50=;
        b=PAn/JZkI9iC+fhKT4/oNfn67uZJBL5w7mSl4ELbC5x36lbfGFPvic+8zj52S0EMTdh
         Gtx+dP1RvwzuNfycIRToU3PNx31AmUD6K4IGIgciuAXqI68S0HmDj2UVr3LUgKTp8R8/
         Alu6cHLiC0P+PP7PmS1+JavDzwCFq/Hzphw5Q94XhLugW0YcYQHwyqsudCtPBh2NUGkQ
         NvtJg0iWTFdeIw7CvcYpFNG6IGrGphdrL7Ib2O6d16HKw/nEWSb1X2+iUoPLSLdJ3ECo
         GvitaDkBhdmm5fheFfRP7dwk3HJDZtwL0IGGwo6M7xR4/B8w5szjUGtIQ8mdvu5S8f6n
         Xd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238508; x=1783843308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C4mB77oGh7s9Y0Uqowh6UFsEunZgz5Qm0N6N+M/Go50=;
        b=Oc/rXVVccgMJ/AVXYaCocY+IJujZI+4choOVxJovMr7keOAkXs3dft2EqEa39gGNuJ
         NMrp46jfPnB7zIznsvrDBH7VqxDn1tDhkch06x+qdvVX9LX01KTxs5f9RSOIO+KqTJMV
         otYnUNTC+i0T9rG3Yav9Xd4FG0Sy2jQydCZ8dwKTcibLW+kqi7PIMSkz8qiwkGQbFexP
         Cir9hkF/7zq/1zs2H8N0Fd47XqUBbML1pv7G6dWviCIkIwLnUDywg1frmkv88AGwqEqj
         pVWMq/I/fXQzIgOI8BdtKqaI8o0PWaDE1/ZXO6gQWABAOyzYUWvLN0C4FQO/sHlbt9bW
         o75w==
X-Forwarded-Encrypted: i=1; AHgh+RptyalYbspANpc4SWPWaIM2AytQh1scgHrDGWSzIM2WVNIbcM0HIpoyhmc/NLbXbGwr8COpKlm8ufEW@vger.kernel.org
X-Gm-Message-State: AOJu0YxMWH7P27DXb59qr2LDgjpCACRo2xt6pXKzwxzM5DtgSiiH2JuO
	TGDYi10FIODWTpm6OK7XRYuznLBNWngQuAcOeFlyXZHu3d2C5K2VG7BSuQ2zgJ61JaWwu0uI6sL
	QhwA/0SFrPFdyplPfb4hW34P7BlnIl/DJiz5B6PeHDORera3r9yuHuTrWDDq3fLq3
X-Gm-Gg: AfdE7cm+iY73lLEvwMc9AAbQuW02izS9aKvi/pz4lK6CJLABH+zXy3Xc5Gh47BTL7/Q
	z6vSAF9SR7/MS4WAdyy9p3ZGYhqA2iusqHTkGzM7eUy/Wjz/WzFrGs7jQRNvQICY8DPp99MJQw0
	kHW1ObAW7SZup6r9XAk5Jnc36mqUsXlUC69TSTfSJzabMgFgq+hHMOkSZa+so5fe5XfX+WiBpNW
	9xt5FiFUfccX1Ii+00WvbMwjQIeuQ5Sid9vFcWPImhJH2dUPXOuk5TI9wvUHgMc0/SCTRhdptLb
	tp22GLuEij2eIdPy1GWBeHEnEmAyyZsWVfl3c4o4jMrDU8oHSreWp6ZZ5YsUeaqIYACI8gkapev
	trqPloy67mL9dVbYvi6zLudutC3AqoEAt7Yg=
X-Received: by 2002:a17:90b:3c10:b0:381:270c:4dd1 with SMTP id 98e67ed59e1d1-3829e656416mr5931333a91.20.1783238506728;
        Sun, 05 Jul 2026 01:01:46 -0700 (PDT)
X-Received: by 2002:a17:90b:3c10:b0:381:270c:4dd1 with SMTP id 98e67ed59e1d1-3829e656416mr5931260a91.20.1783238505896;
        Sun, 05 Jul 2026 01:01:45 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm7759179eec.15.2026.07.05.01.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:01:45 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:30:11 +0530
Subject: [PATCH v2 7/8] arm64: dts: qcom: kaanapali-mtp: Enable GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-kaana-gpu-dt-v2-7-6ac53de56314@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783238440; l=911;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vUUf0SFe8a51kmB8FPrJBDQ5H++K+t9n0PvwI74fWXs=;
 b=xiVpoXS8RMGK31dPCSwHTMfXAXe0kdMwaj2WE5K5tRhNxI6YaIAXwzIjirprdtrPKj3B6P3vY
 S0POanPFfdHCTa9ugRKkr6B6iwFsPGUorM72lzVY2AIYrw8NLJxCOQE
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX6xpYp/ZtGasE
 J2YPdip69DbmPjE1sIh+MoHRpiKsuuxBlvNhbsaxJIIYEtg9J7um0E4OWQ+60QqJvjcDjyQerIN
 kjum6dt/mQklNw7DkoVw2dCyDlRImrU=
X-Proofpoint-ORIG-GUID: dDo2qobctloF1VMCCqKwAcGsM71e_yZK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX5NuuOSkI8Y+6
 v4aVQMd43lVTYcUpKLGOPO4BbBnCa6K8UJGeITJtzBGiqGRZ0673vnR15ZbHl+OzQ4aLzmbNm6d
 dYqIABfi3c8BLDfh+STWJhyoRwHoy6jEp1O7u4ZL3GSerToloIV16vMdvKqeSCRLgS4zk5+GlVK
 iEdidsgF2sdiLQFs1ea5hffBQkV7ux6tOTTNN8XVA3OE+uKfZfaeDhLDxWH5TCBRHlo4ZyoW0pt
 c0JRgfuYPYW3nVd7bz7dd5BgZHSHDGba0anSOftpXfaNMqS0Tr68BMp/6zo7GEADabLKJjUxVD+
 W0MBeBloys/dUNTORFXtITJBRN137U5/xlUbwM1peUeupXHO7dUHyDoRIIhE57+tkTDVYVR19fh
 uFP0hgiuUGDCARo81CqtSIikZDEtkDtneN8pFblqNBJ2A2gxepZ6buZVC236ap+l0rQ3dxgST+Z
 QiSM8hzCNhjr0Wm/Miw==
X-Proofpoint-GUID: dDo2qobctloF1VMCCqKwAcGsM71e_yZK
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4a0f6c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VHn1p_zO8-rooJRYzQAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050081

Add the secure firmware name property and enable GPU support on
Kaanapali MTP device.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index f9b5b5718b90..ba256039dd3c 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -865,6 +865,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.54.0

