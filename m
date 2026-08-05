Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F24047126A
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785936117; cv=none; b=UonJAaSDJP+loLik3VHFlhqWkOA1m3AuGrL7ZCy3saY89QkFZBqRAo3yclb1IEHGGsbIUj4pYfi2lLC+Aihm/zXDeNmUppPH7pSDtpY7QOXiqd+8Uv0uLKmLkAPwzIMuvYLmjfnlLf+ziNld03qUJ9HgL32JQK7gPwalcyqqKk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785936117; c=relaxed/simple;
	bh=5VkQUeFuFAEW4Nac9YvyZJuUHo6mCYwAU5lP4n9uRH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t4oSoARJffgAWCRtUsYwtWX5ATYzz5A9mgqA8Z1bIl+9X7Me961ahbi9IkMUu+uwAjAEj3u0PI8rgPqGXiL7TWb2/AnxnE8vgqCM3H9+p3UQT61hVLv5IPKxvDt1wBLsGhr2WFuYC4dYaS7HB4BTAzLUdlMPtR443HRRxjMA7yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOsMKhOo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZQ1oBFm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOsMKhOo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZQ1oBFm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675DHGhV3313810
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 13:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JHpdaR8EVYh
	E0jWhFMuv6br4nurOHEMzShpwgmiQl+k=; b=hOsMKhOo8cUuKv3jWYuG3D2uLuY
	59ylXALK/F1EE2hnVFGC/0NRMLIvXRo6keLMHZUAq9wqOccyieB+VhHgtrwMEOjx
	ABoegog4pnygYehhqMrucVeQAQFAsZYXqyQIWowNHH82EerR4F1qo5q1yrnmr+3C
	JM+ySSsdx52ib0E4C84WQdmDofnrcp+PC7prZ3BdZ3A6Gi9JC9IUyeXlTuj6OC+r
	IaW8uRSlOLIoQCM1fTRxM7PHf+tBQdcuMOurtX7nwAIxkhhwzqUzvsmkSutpvAeH
	X5Rz0IgsxeY+qA1WJt5gsU4p+pMMwOpy6BZEi9cOo84LhaW0FDhwGdspWSg==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5r0kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 13:21:55 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4574f1cac98so828341fac.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 06:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785936115; x=1786540915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHpdaR8EVYhE0jWhFMuv6br4nurOHEMzShpwgmiQl+k=;
        b=GZQ1oBFmjA2Nall323FaVVyyRoIuHsSo75n+iR490GabS9i1GQD2zPabdD9gL5Ykqp
         tMk6zA5NLlP0KXjBSpBDFYXvsnvy/Zma/f1QrOtFH/42afHeCD15KjDA1BiZf5F2sfdW
         jiJ4IJne8pJKZDnvr+fvM9nLb2VI4YJXaJ8IhLxaFdZCNfsVDIr5ZGbMtMyjYGVC9UmS
         L8UYmwO7O+HxM4GGdo7h5390AYbblg2Sxg8RbGUK6OZxLVi52FAgAqRqeZH98K9ymtQz
         yxXJrCwx5a7SdFneJiv/H1gYGLJW84zJuOqRUaq6di83CMRAxDOGNOXn6QA7N20RhWRp
         GKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785936115; x=1786540915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JHpdaR8EVYhE0jWhFMuv6br4nurOHEMzShpwgmiQl+k=;
        b=oX3pTqvPOFk+az+MyvgyCN4VwSPlPMPQcrzLonqAC9+BcGv/Havi8wPnSI5XlhPSJq
         lJb7Uk41qELttR0klPCJE8e2LcMhV9X+KH7tZ6jaEd6UMqrc9B15tZEfJNHBgFhON6OZ
         I8g3tF3pynFfUyxuUgvJcjfuAt1uIRzbCJoZBn6Aoj90ePFxkRU3o+zq5q2ed6ehohrI
         xYf8aEqQwfKkVYvdkB8r3BE5x8hpIu0oiDZXDfCjlopyDu5d5M6ZWkNGX7MOdUmmFJ1N
         vho3euYugnWl7+zQZ6kZfXin7kCi5sTX0k1NLUJSdC2fcUe99FHqjxDjcEZH1fLkU955
         QP0A==
X-Forwarded-Encrypted: i=1; AHgh+RoSxDZCj+ailcP/Y5lp9S88PXDJa9sv9XF+nvFedDUDqQb5/fRSZA8xWCa8kxrhOsmwfx2jzpZe3XZa@vger.kernel.org
X-Gm-Message-State: AOJu0YxGYVtyqXS5LDBCPbm2/z2X9H9IzUkRhR6jaUCVSWmOMe129dxF
	AoX8MX1jqqjphnlHMHlzyHGIKl+n9UYTEe56PCT5ZnYavfjF1r5eA6dyGlm9J9wE+qEE3CShThR
	KclhY/YxnSIu7iiHe7vsO4DYi5oOfYEl86CIJSe77ZDarKOUq56CkMfSV1LqxiA04
X-Gm-Gg: AR+sD13jFor/kzHcxQ4JXC9tRKKgGjBlGmokjA5ASBEqI6IbKsMgg0lNZ4T8DrE6SwV
	GgKqvUD61W55yGeYGXpl10Yc4CAg0ueNFQb5IXJNX32bEJpGE0X6mCt3/BfjDoz0WML/802RiQy
	2rr+lnyL9auicKf0YJgbweys+DbfRHL/S+nlAr2a9RcEwi4Sr4pbF0+sfeuJJ5L93KfL4mIjLI2
	ZSBlzqswoMEp587WJLxhOfUzSN4ODBMTAxq6bL8hqUXR+M0hSEm3L8RgD/RMj/TKisc/p1m5azg
	Vkb+xn65s3mcgLddrJc5VoRj/Eam3CWZOJhWL+787A6XOjVSdYuM0PtFUeSpT9KoKbZiYKoUO9W
	c4+gGwKujH4warp6W/cAb2jh+v88=
X-Received: by 2002:a05:6871:581e:b0:456:8f0d:4fb3 with SMTP id 586e51a60fabf-4599eda6410mr3507963fac.12.1785936114673;
        Wed, 05 Aug 2026 06:21:54 -0700 (PDT)
X-Received: by 2002:a05:6871:581e:b0:456:8f0d:4fb3 with SMTP id 586e51a60fabf-4599eda6410mr3507939fac.12.1785936114210;
        Wed, 05 Aug 2026 06:21:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4599e63d64asm2412596fac.13.2026.08.05.06.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:21:53 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: sdx75: Use SM8650 MPSS as fallback compatible
Date: Wed,  5 Aug 2026 18:51:29 +0530
Message-ID: <20260805132129.2713174-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
References: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Xea5Co55 c=1 sm=1 tr=0 ts=6a7338f3 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=8cKaNl-6jJHcjB3htl4A:9 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-GUID: XnyNGmiCJH2Cca9r987V8Uy4zyTZbp2u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwOCBTYWx0ZWRfX4TAllkHg++Ye
 7CgPkXmyXAUYFlaqpZEJhFB/sJ/uzjMaYkKzjX5YGSTwqPBaRSCI5ci7jXDWJu7UJedF0jWM2a8
 voXGuSaYbvD3YrQfu1Fuv8yMsMZp8npX3nNc1pMJnmIn6RtASuum/NasdN8tGptw9Wacw5pG0Us
 EAi9C5Avd7e5M9uZh2m5c7GKVoz9dsPtWY0TcxFraHYufcK0OQlidcAXciGbO5vNawrbjbdnNam
 8Mrj8YoiSi6WwhqEwCIyPcEZuvvMKzSOmC19x6rPbkNffskhwGBcCrgaWc+kObeLgVzfjfTdWOW
 l3cQzFYETE+QSZZpSf5X43G6fw7vsNoOEwDABRK4hh3LObB5MbONBBKDU+xTvfpckyobBV2sT9x
 vEgi1pbeNHElY1oJekNhBlYMXHGZ46qaKXd5TF+VKypWhsp2ZUlVd5qCty5R7WwxaY+FWnIvpT7
 nMkQB0SQJn5NWWjcBhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwOCBTYWx0ZWRfX0MDQxWQ2l1Xe
 TEufUcH/l+m6HHsld5GY4mK1rSdb4fAYugYUmgRmmFS+On/FghukG5R+Qkfu1jEHaFROJdywg3o
 Z8+6+PSZlpgjSBWa4abSawL4t3ntil8=
X-Proofpoint-ORIG-GUID: XnyNGmiCJH2Cca9r987V8Uy4zyTZbp2u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050108

Following the dt-bindings change that expresses the SDX75 MPSS PAS as
a SM8650 MPSS fallback, list the SM8650 compatible alongside the
SDX75 one so the node validates against the updated schema.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 85cc9c6e6f83..dc9c4ed00d4b 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -925,7 +925,8 @@ tcsr: syscon@1fc0000 {
 		};
 
 		remoteproc_mpss: remoteproc@4080000 {
-			compatible = "qcom,sdx75-mpss-pas";
+			compatible = "qcom,sdx75-mpss-pas",
+				     "qcom,sm8650-mpss-pas";
 			reg = <0 0x04080000 0 0x10000>;
 
 			interrupts-extended = <&intc GIC_SPI 250 IRQ_TYPE_EDGE_RISING>,
-- 
2.53.0

