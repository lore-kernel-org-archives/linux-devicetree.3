Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F4E309EE7
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 18:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782671126; cv=none; b=DsLS7RaSUeUexbxjIVyuj45mA/8BWeCUomyi31sLyth/Vm7ceASw7vF1YC1+lU+i6yug5AHmBa7eYrFq79ITHjbvL4+yhTe2a8KxeMjoSkxMaS5W1aM4t/y5JXhGmRoMipjZ/JN/Bhuorr+7dz5QKPOr9HoPVSR1vfj+nBC014s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782671126; c=relaxed/simple;
	bh=4CnhHAH08P2sZu1lx5Z5rOG9mt5xMU4OOE4XsN2DX24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LhMn9c2tvNo8JI1HgGYKonY1zWdlnPaP4gQvyWEvwMzmH3Winj2kJth3jj4UgdGNj7Dt0HahDFx8PbPOw9XoRGIPe89TGeZqC+GvhEisAEW3TJ5peZRBWjUFXxrnmORkf30V1pKlmDxgnmNNeVq3inRH1mb7m3B3AWnrGZY7QzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Orqf+F0p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvGOnxg7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Orqf+F0p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvGOnxg7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHiavP448191
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 18:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E/Adwkoxov+upvWUoqX+Dqc020CT53dbeXdpXRu0FmQ=; b=Orqf+F0pLb/58jZI
	FhZ8Ls+LPFICJ+Jq1rTtdumHPi52Mvy70o2Yugkd0K6l1w8x+aW69fkBewkOuFVf
	tMgiGcjUqbj9ho/thCLppGa+4rStJetrNuoYz/Enkx8/VUv0yW3GRYti3Yn/UaF5
	i5Cm6xAvzQjoNl6Y177spR5jSt8J+D1wfTjYP8poRNGLyhfEY7/2DfNBfn9/EEXK
	56daBXJURjprC3Mv4Nehe/YB0ZzxGIGH9cecGNdMnix3An1TiL42O15OmyA7fVGW
	2QyNNahUgG2+CO8rjmJ0aFtS6yFv3xKzgJGNIQdLz1LOdvNm4oPMzZaAxFXcENXO
	ugjaJQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tukch2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 18:25:23 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139ca26403fso289098c88.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 11:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782671123; x=1783275923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/Adwkoxov+upvWUoqX+Dqc020CT53dbeXdpXRu0FmQ=;
        b=cvGOnxg7BHmIiNRQiCZ3zkrFS0Viz/xi8wBpwebU1E7F94nM74wt8X0VAdN58hAfXk
         NTzKFw+7WP2d9YByHR2nQlqjmR0BmfwIBxjGAXVH95I8BhNiMVdJVGcQrs3Tg1errRmV
         O8KkQtyPPPGNf/A/1ICAluSWC2fxyH2Fjxwjv5skeQ60pwrPGJyrzVW7SEvSqBuDV4t7
         yxxZljKYnNkWgb+FKmYym1hBdzOAsk3SVQv6YYoc5KrcBQeIZ3IwD5B2pq9YwG0x8zhm
         Rakd8WEjA0OPEaU686yHGMoLu4jC+GObn2DL+pUsvA+spVJhFh/Y4Yz3UZXcM7lKG8H/
         lvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782671123; x=1783275923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E/Adwkoxov+upvWUoqX+Dqc020CT53dbeXdpXRu0FmQ=;
        b=ern+B27ruzaPQgAsxfU6xOKc+EX6vEi/bNODQDy6EAKuH2l3T7M+aPnLaA0myoA3f+
         AkN5NHwhCG/LMedWQgiwdFgCLCjrdG+7iRIzzmvu2nVYQzqBoqWFshspCyfzp6Cb0q7C
         wTll/quHDPmMfp2gdU1CdlxovkfAWwk1OClQ+dwBzuw6XiOBgy9XECUsbmIB7AmSkzi7
         aW9a9QeoKKMhAvAeaWXjShJ15s4OtVfejbmBD8CD8AKvkPRUQUQ329lNHbFlZ+BiYZra
         YWcFkrBWsVfQTXIK0UCZHnZz40hYYBWLzkSYVBBHGdGuhUyG82wy+f7RhqbHVbi07NtE
         1F6A==
X-Forwarded-Encrypted: i=1; AHgh+RoAO3Ii42+H3svBB6omUbROadTWCdXi05KYME4jtMxkSJ8WpnKQH49/636o458BcFN0zEx0E/NvM02H@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Lvng7qxOBokvwDip70kn5bwFiOCPQwMBjq/263IprAPuC3mY
	RPOoAFcGhmQwVcBJFEpDOnpBrP40fY+4AbCMhAypJ45FXleCC9Rs7lA6znWody6hgVbJZ9AP7wp
	r/d6bkYx5jz3rw1oQCQXM3QjNQmRRRHR/l6nM81NUUbnGooceQVNUi9iBJB/DHu8v
X-Gm-Gg: AfdE7ckITKDUO8/lhynm6apnPmi3oLrcTWA9VDoDWGUmkrzEigvs64CQGECgietGjJF
	Le7YCFoVtnSvP7XQj2YMAPD+otf8sxE9xIU1PEgXIiN3z3EeGvVEq5bgyxELqp1E0GnmK084H/F
	oOUMi7L2lGmZrFoMdbpY+jmo+NfxigmLt88xoQerxIc/aCOPY6tLv+MPboTvbIgbHcOXlXqq4N/
	1cVuh1n/Se17fsgAVlX4zLoXfCQFXsBMFLBXZXCt+hWOeux/nVyC3nuxNXfaafu/jZTafpJhFqD
	cF9XZRntpj4cAeCqpTbgHil6rd4emUEKjmCsCqcJ6APSvxYa/eKhg2qrFUl/Jz7PGvNcIKBQrCm
	y+44Fzzsw9W8Y5QEPtIKHgV6/9kveNp55daI=
X-Received: by 2002:a05:7300:6d23:b0:30e:c38f:eaa8 with SMTP id 5a478bee46e88-30ec38ffbc9mr2680843eec.4.1782671122879;
        Sun, 28 Jun 2026 11:25:22 -0700 (PDT)
X-Received: by 2002:a05:7300:6d23:b0:30e:c38f:eaa8 with SMTP id 5a478bee46e88-30ec38ffbc9mr2680808eec.4.1782671122355;
        Sun, 28 Jun 2026 11:25:22 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm37508218eec.19.2026.06.28.11.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:25:22 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:54:00 +0530
Subject: [PATCH v3 7/8] arm64: dts: qcom: shikra-cqs-evk: Enable A704 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-shikra-gpu-v3-7-9b28a3b167e1@oss.qualcomm.com>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
In-Reply-To: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782671052; l=803;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=tpJR8ANAaLpNkDfQVcPg2PDtoJzHDFbD5ZJyKcQDLI8=;
 b=UrwtznvEchsCPw2f5j1Z1h0DtgwgaYYoTKCdTBRg8y+Ki3D0VxImpc45UOndP3zz37q3BG6yE
 WXiLutKmQAqAzUYa1pzJN0Hib1HgeJhRpwgbC9jZgny/fpmO9bmcx20
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: rVy3BtmIebJUScFIhBfwgWX0_hQa3roc
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a416713 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: rVy3BtmIebJUScFIhBfwgWX0_hQa3roc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX3PV9Pzz/O1/w
 NfL8L8DNfRZlnZkUNKI5HDpMpIa4zfY9NwubsIP2lkmDOIWrHm8k2YPII8M5CwLzOx2El2FTuB3
 zCldl3p/9vUOY0DeA/jCp86DedQAtkY7Ks16UmxzdA/9df3Duxed8OEpL/xQKq38sxVRksFUHJf
 pivI6YfdKYfDnx/NVN7yX5567As65FJGKKDpRNeVw+WRYKy9cXkvS3pnXJsO/bZfmuspiU0G9dy
 jg4ABoTgU9ouf2rJLx6/fxutXph7l+PehQ7980kh4tpMZVIryg4pGMyDcJRqBavTuNTwVWeR95v
 tBz9ai0M2mncbT1Yot9lAvmosKEUOIzHiJxOpPGSNPJ4GNJkGAMMRns8M3vO0r2/oxHBa7V/9J5
 SMvpteFBkhjj144KMDvB/0GcCX3LVBgM+b1A5QuYnbZAxYyEImzU+iJQ8UGvTcN5o3BjtLy4Tpf
 d/b6l891SuwsScDHcKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX2OXqWc5TW3Cw
 sBiB7sD9kQm34fiMF9KadDFFNSues7JCv7ogsaEYZkfRQkyrl9ajpEnVeUP58O4RwhAiRYo88ta
 VDIxzVo+l5yAg+/N3ZkMnw/ktg0HKKk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280165

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Enable the A704 GPU and configure its zap-shader firmware on the
Shikra CQS EVK board.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7ae..94ef498a2467 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,14 @@ chosen {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/shikra/a704_zap.mbn";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;

-- 
2.51.0

