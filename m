Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD3E4B95BF
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727997; cv=none; b=YAgxXvO5U6JVpyz1rkmtAzu//8cZFXTpavavpKrpNr80wjHweFc2kpz0WmBajMCDAEtwP++EWqQ5CBt2uRWO0RoJv+v/+B1+MPffiPNtS4liw9vKCeaX/rXIFHP+oanKvjgTz3Pmq+TevSHgQo1zMUbzPMC/nOls0IGsBTMm+Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727997; c=relaxed/simple;
	bh=nVeQof90N9/+rn0tz6Y5h6juwjIaGy0PYkqqWpXw4xY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BqqFFCAO5zZ68btQoFMxjWCYuHEqzvSTpIQPRldobYKdgx6ydO130Ub0r10JzsCNZUwNR1rIiUwmtOiMsnW9F4POhXpvHgKYGts8drx1KSLd1RPgvsmP8JV+ofnL02JLkHdwS+RkJzfsvAomTDXJnmXE9PY3Hrt3yfss3HwIQ+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMLlfyv+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jAZGtvZ+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMLlfyv+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jAZGtvZ+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dZT5385301
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kRRf0K4n/OMGCKpZc2soc2B/PhOw76TarQ44+SpuGLw=; b=TMLlfyv+jsFdDOoy
	8wE1dytKFlixgMMR21cP0McWiSJmYAqj6HSzXmIOCjSDnmGOYCUpTM1zxBP+xCYO
	bTGUuqtLWF4A3rQjfmMi3m3zVScqBtblf4mF6b4ip80zi2dujcagQV4IYuxxsV9m
	vgDF+mxyGpqU6kMbhYEAHIT7WzOah7C9erJAZGd8gsZ5ZL5+2NMrb2FzcQNa+v74
	7bwgEiKsrRYjRDdvhvA3+oF9NMtrbwDTNhmDuFlMPr3N2yraRdHtvHB+m5fVj+yt
	nGFQ29GJujAuOqoN9TtJS0xpt234NqId9lFl8GM/lZ60/bjjvF2J/DAmLhaTh4A/
	v7+iYQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grwxrsgm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:39:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc51591102fso878467a12.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789727994; x=1790332794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRRf0K4n/OMGCKpZc2soc2B/PhOw76TarQ44+SpuGLw=;
        b=jAZGtvZ+azAdwLMuEqVWDSEVm1v8kRuDQ/L/FEOmE3X4XWTM0TkJa3672sb11ZO/9Q
         1wBCzSw+CwZMTQAUhdPOOSpNNhf3BPifLQPPayqZZn3DBnk61pG0769HeO55VTR3zQw5
         erlk3qQO8iTXtBPuvuPltHxz5qhUFlCkbg7oTtFE8B4JY4uQnmaJ/Is7A4JVMX0NG2Oi
         zEcPLh81Yj6+wsn1sgCmW/BuDCH3SyI1jdRh6bNn4KJe+QsO5k4g1GBlWIWEslN48sdR
         421SEfAuTCmBBH6lU7jyUMpcWFmYOEqSjlmj19S/xgaqjsI49Lms0+kQ8PXIPAKPe0tK
         /nVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789727994; x=1790332794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kRRf0K4n/OMGCKpZc2soc2B/PhOw76TarQ44+SpuGLw=;
        b=x4B+EWAn/3WOIDQoLJEdJpDc6SR/KCzRT4GRX3h99/y1NAclP+WIkFfQ/UebmDof7t
         wQvzXSowSWUB12SAbQ0ZuyKEgi2v9nYPwmeumsuVWkFayLwEkvaXXkUZB6cFoDuShEwz
         bpy3JEjbI9zw5wnYRvZXYgn7gnHMD7souC0iN/hv6+Q/45UzGY4GMTYGSqdzVeT+/reL
         puRR0TVZAAAb6b9qg/FWTkE/ESn751XIeocWiPBv1Yk0ItFdScjVibxyF/cV0/5yrKSi
         QVL+T+o+rlhL2pc2ekO7tDUsFTZEB8CKNlcfweDrQ63ozel50J6iM86m+d4WBaDxrTJH
         8lXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOTtfDTP7COFuzVorQz8LCYrqDwRjN0XpsCA2SohPOKqvdarILaJGQ8j0EnDu4wiXsb4kIjTkWmXP9@vger.kernel.org
X-Gm-Message-State: AFuF++l+yf2CgdFMkkViT7ERjBrCTy+uikFSI8JZYukCWRWrFbUxuj5y
	HCHZmAE7FVVAhNxfg9ppM38I8KT5kx1nmzsH1CK0vZTymRA/iqFdYFmXUxqwq6onf9hAI69s+sZ
	6rqZ2wvWbg+OTAZ4jiSZAQ8QY3uCfFVJ4Xz3+8DZfb+lw6NGtQAAK/7nQ2GMbrc0V
X-Gm-Gg: AYBFou0Ri2cf5YXczJ65KZm1xuZ31anay7OqFs8PPnoaTviv8U8Cr8CsGltvzEA2bOi
	kf03wjGnanCuKMafxZ2kSCGp2EO0jVKc7S/bcwEv/DFQzsWAcwKfYYhF4LS7U1eZGWxMyY4/c5g
	o7OO+vmLmm0Er8wYu6Pp91QcgLcESSLXMoMHgg4uxhxJM9TqV6hGatVKnLdW6BfCACaejr7aAhH
	uGKXimv1QPFxF46sJ1p6hLbValn5yB6vyqvZTK4bX/9HlIdvvraBNoSuSJKNNHuv0PByAbXVOZS
	+qnMN3vGmVKeTYnIKB1fIRTBVGIs0EiuK8GxF1D3D7teg336mrkp89CtTRkIoYtTFILQnvjU1lf
	L2ZaFAjJDKnrZVQ2zc9SGXl0hrA==
X-Received: by 2002:a05:6300:6698:b0:3cc:9620:5816 with SMTP id adf61e73a8af0-3dd8c3fdecemr4853639637.8.1789727993704;
        Fri, 18 Sep 2026 03:39:53 -0700 (PDT)
X-Received: by 2002:a05:6300:6698:b0:3cc:9620:5816 with SMTP id adf61e73a8af0-3dd8c3fdecemr4853595637.8.1789727993282;
        Fri, 18 Sep 2026 03:39:53 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c286d98e7sm4020702eec.9.2026.09.18.03.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 03:39:52 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:09:08 +0530
Subject: [PATCH v2 2/5] scsi: ufs: qcom: dt-bindings: Document Glymur UFS
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-glymur_ufs_qcb_enablement-v2-2-16619f7e36a6@oss.qualcomm.com>
References: <20260918-glymur_ufs_qcb_enablement-v2-0-16619f7e36a6@oss.qualcomm.com>
In-Reply-To: <20260918-glymur_ufs_qcb_enablement-v2-0-16619f7e36a6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789727970; l=1348;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=nVeQof90N9/+rn0tz6Y5h6juwjIaGy0PYkqqWpXw4xY=;
 b=tIxVVF2E2+L4AZMiprhTKBp6wnn6lCxQZHvLvhV2ny1iCX6mz1OPVf1giFMtRNw6dceFzwoYT
 06bYt+zMfa0DYxgYH+yjJtZWb71cJEcKQXXWfFaxI+rfBvfemyYhCef
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Authority-Analysis: v=2.4 cv=EMWTQFZC c=1 sm=1 tr=0 ts=6aad14fa cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Fvqz0uoX0QqgC4h9zMkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0OSBTYWx0ZWRfX7yrf3+VoSChK
 pJ2q1j5J6wn1CELrKpx3Hnv3Y2O5WV8gdlymrUjyCuQ6dRY9aU4NNvC1L1h7nr7a6YxybsQ05zk
 2UP8sTt4+TvYeQ9y9uwJ7mHWFA1cWW+hfv7IKk0ZiQIw7pjofpmjqprxmKEGeB8a4SQK72gCYbP
 6FVZPRM9h3pbEcFEICgDjsu54VPtlybtrAcFaoS1naJtYs7xLJLzHP9UUK6fSJ3xM/Uje+Uq8zX
 5g3fKUBTzDT/FGEhfvhPobJFQ/8GpsGbjMldvubq6Cb42vBPV2I5X7QGtaz+FkaYkGBa/txqKk9
 Jnoc7Bs9JngplCQsRhgwaNABimw+FTQJQZt4uCAfmMlDQHtX52oSSsaETG/AAFLOK82KcCSonT6
 Bvpog5zVNLsmPNqXeyA1EcUs1o0yT2gItj53MfDjHiWUdRh0dl/MaS8XuzcBO0LrRXMGDQlQhFV
 4GPb0Z8pKtsUiQkNJFQ==
X-Proofpoint-GUID: asaM65itUcW_b2r4alqGWDEDK24HUetr
X-Proofpoint-ORIG-GUID: asaM65itUcW_b2r4alqGWDEDK24HUetr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0OSBTYWx0ZWRfX4Jn+1Ac6YQjW
 C+Onvg5Fow6IebO9z/rFe0Xo39Z3vu5Sw89I3mFUFJixhXgEFhDdeAdahuWwMq7sL9zTEJQrIaw
 md83vMqpWKtKgX8UABehwyqCkA7gqGs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180149

Document UFS Host Controller on Glymur SoC. Glymur UFSHC has a
multi-queue command (MCQ) register range in addition to the standard
one. So, both reg entries are required.

Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
index d03295806657..f132b1a9ebc2 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
@@ -16,6 +16,7 @@ select:
       contains:
         enum:
           - qcom,eliza-ufshc
+          - qcom,glymur-ufshc
           - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,maili-ufshc
@@ -30,6 +31,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-ufshc
+          - qcom,glymur-ufshc
           - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,maili-ufshc
@@ -80,6 +82,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-ufshc
+              - qcom,glymur-ufshc
               - qcom,maili-ufshc
               - qcom,nord-ufshc
     then:

-- 
2.34.1

