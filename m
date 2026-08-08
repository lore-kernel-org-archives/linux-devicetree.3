Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4962D33BBCC
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 20:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786220649; cv=none; b=i5HX2cXbauEphYvAaAGKotqT2SteHB4sK3XL7flXBK886UQ2UxMGNvoi0cVn39nvpymY/kx8/3XFFocv8lnuzemIPS85nve8HS7xVozVyPR5/ZeENfijaLLi/zS/8boiCivSsjW98X9eRGGE0M7nnfXIygsSc5BPuNV6QJBToPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786220649; c=relaxed/simple;
	bh=iDieC/IXjVORu0I0IBT6FMQsM32OIPRIq8KrWM2UNhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XZjeT9nY9gLX0OCjsDFsMJxjyXbkaoFd4kkAGaMes/od+540yAxxuudLSdcXnG+UPesDbP+mYfKPwVE03XIWaprSSZ3FqSpys3OlL95RiAv99z70hxVCq4+fWulpHvIopml941ShR1WVO17zQxT5cTsUljDBMz9qbiDOmiVUEVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FlNcJ0t8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e4agvgXz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FlNcJ0t8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e4agvgXz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678Jw4KE747397
	for <devicetree@vger.kernel.org>; Sat, 8 Aug 2026 20:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	01u6cdInuZafszhJdWqPh5sCL8liQnvk2eQtr7otZ5g=; b=FlNcJ0t8cBMZQlSo
	uh/lPuAQr7QH6VsnLDgUNI+a0RuhGBZIDnGgQEYcsIB/kQBd9FKApWNXS+0qcIlg
	da0cI02Fci0Q3KqmcYMWgH4cFvMwHc1cs8pCsuLNIS1utHDXw0UHYGRfmOMVOdJ0
	K5YdMraYExRGCTcIs39NYMfatpsdwMyvuQymKNwmtFRfC9Ygu76rq4acaspIqDEq
	rJyulnvbBu4RApGUEuOvD9bNW/n2uLxIr59jD3fMzM9I8fucaNqPZokQon9t+n8u
	gLrao9pSZvHLNV8NNjhIm6TuuEa0AnxBIz5tIYwm47BOx97sPudlmjJpPNqFid0j
	K7MZbA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwstp208r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 20:24:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so745120a91.1
        for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 13:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786220646; x=1786825446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=01u6cdInuZafszhJdWqPh5sCL8liQnvk2eQtr7otZ5g=;
        b=e4agvgXzorKlTWtjAKHzmcjxbBQ5WAZmqPLWWeLflyafggyoknNrXwBaPGy+oDDh7g
         06SV+4eIcImveh/oNroiS4bkxK/vEPVB0MFABjl9tDZFlosP69gKQSwjnLScxIT2oveg
         ROuuQXlgstDIDp4nY0FJj97y6FHLUieEW8YnXkXkbeTYG5jJ5IdSa7TF3HJJ8SrhdiLo
         PDKrz6kqk3zRwnIDbktgcwwGUfxPsVYz9RI2gy6onaszTi68Bs3INe4z+f2frUPxw6rO
         Plmdf1QSn0yxKPvtCyuXpaqVPIyAQ8YI7Sy5bkbMkXBRvGsjEu8qxoR8iM1Xus7uP8yH
         NgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786220646; x=1786825446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01u6cdInuZafszhJdWqPh5sCL8liQnvk2eQtr7otZ5g=;
        b=cH0gmhpcS9j/cKVc4/Rqb2fpCoNTihRD/1KZymNoEsJinLilfcjBvLQRO3w8rdpcki
         xaFnNjnqT+yGe15ruPTJon6fhhqRJEPAcc6m/mwiF/hCErvLS8RryD9SQIqeNb7R/0Z+
         DGMIzrw/H/m98JQtSetLtNPXbiO7A68/oVigsGzcSEvRgoqbEnkKoWXkMC3zB8uu0Y1N
         /hCZlww6HjtYqRsGnaYZTEbkFww5QF4JNcMNA+6jpG4BLewKsFn7g6DDqCRUvQ9IWA48
         rzrogXgZaVXXFhdosubmx0Ml1CwSolcNZBcwyP/2RARozclMfb2PdXKL3J1dMDXHKEfj
         aAAg==
X-Forwarded-Encrypted: i=1; AHgh+Rom+vrrfJyKiWtOS/VKfRbtuwyNvzVrKx7ND/bKFgopaaYj6JRdvNTguw6U49fOKr+ozpGJY9x3oa+M@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0aJVGw7Gh32zH8XQ+H/l9OjXb59Z3P6lRmjhsqIG8SL0piDD7
	X0UBFEu4ZNYVqKBUx0Q7X1fq1k/7++dnBZL6bb8xrrWwIkaK5kzoS3PW4bXrvouvh+/msuLTzkG
	Fy8JgHRFqeg7p8s8OeF25+pKw9/SVozwikuyVDSe0Eh1TN2UniRIlUoQ/dmZSMt4A
X-Gm-Gg: AR+sD10VIdvJN7vELEVS3ACpGFPqmQN/YGJDaJBV4EWyRSzedvSsnRrT/aVWCihvmwO
	9r3S2I1tGIQO2nNLC7SZKfipTX639g+Bhldv1kn3ssK9wu/YhQoBNVLF/sBGenc8oCfzFONEwKh
	yBzbIwZtcsRZ9PoxOnqy65WEJ7dTH+T/fcNhudt1YNbHRhNCCKl1fVFZEDlAaXvuNpf+VyQv1Vw
	v9n6KiQPenSoAMadF7NoJ6HiYAElo7q0y0sKUmSQc1hfQeRDelaPonQKIFiUHz+w5Uazp82aYo4
	jmqYo0ZT43Fkca1/2TnzEdvnUUYWJ/ALj304LrTwX9ZaKnS9j3Rtq/y+y1OfTvQlmhwUPrTrI3z
	AI+ss7SoaSxIWCLHeYu3aKp2A
X-Received: by 2002:a17:90a:dfd0:b0:38e:5ab7:ce9b with SMTP id 98e67ed59e1d1-3909d928d54mr19724787a91.21.1786220646177;
        Sat, 08 Aug 2026 13:24:06 -0700 (PDT)
X-Received: by 2002:a17:90a:dfd0:b0:38e:5ab7:ce9b with SMTP id 98e67ed59e1d1-3909d928d54mr19724736a91.21.1786220645731;
        Sat, 08 Aug 2026 13:24:05 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86e917sm26357417eec.5.2026.08.08.13.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 13:24:05 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 01:53:13 +0530
Subject: [PATCH 6/6] arm64: dts: qcom: sm8750-qrd: Enable Adreno 830 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-pakala-gpu-v1-6-207ad1fac1c7@oss.qualcomm.com>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
In-Reply-To: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786220595; l=735;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ymhS+3e4NByeoLtvhtUzi1OU8oKq9ZdqernyZjiEAeM=;
 b=uYjdjbJ12t5VAKxIr+XNECqLJ2vbrM02URqAEEMTZNYKgw6+E2KGMRbEYVaJ29qV+aCEKIHAx
 j41pxbg/WIACKFH84SmDpzBYVCFukR2yWvTRz2H1vQg2XjMQYUVYkpB
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: vM7GBXomrChircREvp7fJ2lcCCd1zfKI
X-Proofpoint-ORIG-GUID: vM7GBXomrChircREvp7fJ2lcCCd1zfKI
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a779067 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDE3NiBTYWx0ZWRfXyEkLLPzRJhrP
 aX9r6nlJfJRNfmkW6r4fAulY1BsvlRDN6DmJJjb8DmluIleUOq1fP3rh+wkbVurnzkUqiwbW9fj
 KKqKEtV33jczhl2bS8cr3imq6eIh8BmasN+qH/LECFcoZe+VJ9NQlA0nkIs3t61jqldKTblOCL9
 rJqKW/D4ZWHUdEQHXYLpi1pHq7vPjnM1d2HhSYQ5JwsgMovc6CSmVgVE8k1FuNlbLm1/22CKbf5
 27RWJBPgpOf5sVswnRFikkx24K9k8PST8CvW4eOG0p8X+44BbXdz1mOqDUEno0umPhxbj9+p8VC
 E4DqXckQwrRr9sGePOchbZucW7bzQC+aFElAJBVQ36gYebDb3dgwEsgL7/Njm8/NbXgZYP7amxE
 KkBli6y+6DBNAO75TZgBrOvo6YpatdmQjXnmcQDlOfa9IX7bQGMqHAQaSr/C9vB6sTPzu5d4uCZ
 Go0ZNHy+Ai9x8rcoUBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDE3NiBTYWx0ZWRfX55naX79kdIzj
 478wLkVskrB2MSjkWXAbGFCgL7rsYvwolCU7EcdA9EUABvdh5DW7JeBJ+6xSogc8o8Br7YYiCIk
 axDfjDzsAqOKVF+m+CaS5NQO1s0fsG8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608080176

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

Enable GPU for sm8750-qrd platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index b56317cfa9fc..75927e1f7b9a 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -858,6 +858,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8750/gen80000_zap.mbn";
+};
+
 &iris {
 	status = "okay";
 };

-- 
2.54.0

