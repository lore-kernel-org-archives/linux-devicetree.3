Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3413EFFD2
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371742; cv=none; b=XJw26/Bw5zElfh0mJPv/0Rgp914WTCWSzxp4fepbXixHJeYV94OEmmBmEdkxpuJxuRE6ti3wnpvvkO0c2dahBJhnwjJjxQkHrKA3LOuuOQFMPVnxlaOKQU9k8vVTWSXeJmUoN3gY8FHDkOR+fgPdg0+QmuQ12ULIF9XT0VaA1EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371742; c=relaxed/simple;
	bh=9dVBNK9W+CBPCLmmp3NOmV0wGLXOczzNZNj5nKU42Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=exboM1eB9jbTyLxPTc8l2tBWYNUonPZX3NUyAZvaj2I92xgYM9kfSHlw7FXd9/lYZc0wIZ8/OvVHApydSkZe5qp27kP0GZfDMzLFQIOnkqld3TD8cmxTEz9KYCGIrSrPyFMi/mw4UBPUy06m9EO6PbTq3m5UROaLjDZSswhCZhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bkROjClV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUVuBR6x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bkROjClV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUVuBR6x"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iqdG3196570
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4RxHDRPQG5GapNsDYLOilk50
	BfaWg++uWdw5jiML02w=; b=bkROjClVznLYfz8iLdU/kt6duMSx+31RKIq+PWIZ
	h9G4ftJejB5gZ31ZsYe6ph7EezRESNiUKiX7yL8TmyqAIsZaK8mxMAe7/t4ksbiO
	oLyy9DU4hMaxXP0TLt+CFO08LgCUC+Wi+i7VfBlglY1h1X98YAy4exK7Uqh+4Sgb
	bCJsAOzarMOuk3TAOme4s9caq7Ges2wSVUd5JxtyPOkZKdd2D99LmHU39Q7asHIn
	YkglleKiJ1jziGnoHAkV108YIeWiAK/YHqEXaNx4/qq60BrKYixPy+qlqYAnKpei
	+6IDkHS0WCyUbvmccI+/3JvmUV7P5AE+4rrFffwt6S4s2A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cdhyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:42:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so596816785a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371739; x=1789976539; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4RxHDRPQG5GapNsDYLOilk50BfaWg++uWdw5jiML02w=;
        b=YUVuBR6xBPH2+kTh9VrhXge393fvhsKmXStd4oalrZv7sN3j+7P7UnVndPuiyxQBcG
         jmB+YhudGZyauNernLJYsDH1H70tl95w4eM7ovrAbo7/Q0wQLjPXQSo73yMFNAHb66RN
         HRZHT9uVXFYaZZLpNn7hPxXqun55lup39LKp03ZCI3GXpD7x+yYgYGaOTM77sjK6S0pI
         STPl6p/LQKi5eqwWrZN1MHKZKBSDZQ+6i6jfKUiHE7SshgzGFG+LxzPDjebbBuoCULq2
         6GFe7ccfVxVhxw2vZBGK9MWAuFsMnzou0stJmj0TdTnFm4LCJkXnhjqWDu2kucX+Q3pS
         rIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371739; x=1789976539;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4RxHDRPQG5GapNsDYLOilk50BfaWg++uWdw5jiML02w=;
        b=f3gaHF9I+VsrSa6XNpoDkyeikltency6akuSU/bAEEA1u2/Wm9va/qf3FCpulFOXbF
         Led6pZffBVFyrU692z/dzxf2zsDgIHKmwlOoBDzgKLirYDyvc/4giMVjCDkJt9IB9afk
         q9CvpUrEEjmnvmtM1tl9tq4qHn9cSij7JlKU2XhUBHooJwtvJMfNNGgIihZaTW/0XiG/
         qdA+MYHzdwOYJYHXqtyG97/mVFOMvP3D8L9fNiM0AKKWryUEx5cbGsiU7icWFHiDe6uC
         j2uJRFRVjkw08rbkdLSRXcTNKKGfDiiyC9zM6ap+WLrISeblzi2vJawBSbh9q9tT/7iN
         UhHw==
X-Forwarded-Encrypted: i=1; AKwUvBzLmO2VCch2Gd/+ufmwQZGwyjYQy0gvZjC8kkeSpnMVWGXBQlyfCl7pnQXRAv2Ht5Wlo5FDU4h+1iCq@vger.kernel.org
X-Gm-Message-State: AFuF++nY1+we4BukpYxaOdyVdpmHcZuYp34bZp9QdwGwNLdH+GjjhPYp
	16bB/xKw1bjgwvYkcYtRD3FFnn9n7xUxgabbPlUNXD4Lk8q6vkGP/ktVMj16BFcb3WtRy0F+3OQ
	17wHFG+j4LxwOUjbTWNo91PqHwcLHQBFpR6+v4aPpnRtY9lAj5cQUmX70zMKYiEn4
X-Gm-Gg: AYBFou2/qSNubVaO1jwZhcEa/hdiZfqGVR3+aV2R+NQ0Rcd3HdEuasp/NfGvXZ9KFdo
	HX3q0cN1OR9GRPfym6NwSeizbzhLWefnjm3woxzXc5i24tr56dP7AUx5f9EYpbaw8WSvTSq7Qaf
	9DkoDtP1/gSGHWXLlXsO0kxsG4GQLWPz0XvSQnFrcpY5e5meEQ/nXDjGvmJ0Dq4Ducha3e7lyRU
	Q2ek8P1CMYsFvJiPTK4Sfk3n68ZokoNoO304nm7YhaoFTxJ8vsSo6h3rDz4tZEDo3qJzGXz1BT9
	PqNz844D5t1JqO+0F1DFtly8V2TpnwjyqAu01c33SmY6AjeAoEYg/ghlTR/qslzcyVkrfxV0l2X
	DpgXLelGy1L9HeQ==
X-Received: by 2002:a05:620a:461e:b0:93a:5d6:9ef5 with SMTP id af79cd13be357-93a185a8922mr535358185a.12.1789371734313;
        Mon, 14 Sep 2026 00:42:14 -0700 (PDT)
X-Received: by 2002:a05:620a:461e:b0:93a:5d6:9ef5 with SMTP id af79cd13be357-93a185a8922mr535339085a.12.1789371729125;
        Mon, 14 Sep 2026 00:42:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e62232cb7sm230063755e9.4.2026.09.14.00.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:42:08 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:42:06 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 24/31] arm64: dts: qcom: msm8917: Add domain idle state
 names
Message-ID: <tpu3ocpkqxoyur27iwrrpjnrrn6goia2j5uflhhu4qbbjp4dsc@lwsl7lo7eti7>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-24-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-24-660c31187819@oss.qualcomm.com>
X-Proofpoint-GUID: OAXdnye5ff8v4pbrjaX5SXo8ad20mo6w
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa7a55b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXxP6LxAKGTVGi
 AQr+/uNAZOakNJOIAxB3vLoouWfEUvHaysrAzquxNyFQgW908xmw9MrnV945q/5iPsT2sOrkjiP
 UHMHYUU80zNGawLd4AsqSfKvDBZNlRA=
X-Proofpoint-ORIG-GUID: OAXdnye5ff8v4pbrjaX5SXo8ad20mo6w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX5l3KSTfS1YgI
 Ot8iKk/57dVMjf3Fa8bNTH2MlkCm14qC8XW+UKWh/2l1tDCTEHc58kDeV222fyjw7JP6KYKo35R
 /diMDR+92Me7XHNmqRao76U2Fy9zArcU5+fKFK9W7WvEvh0HjIEvGnsXqQlvGI4v+l3DTc69Cyj
 QNci9+dC6xdNWzkWN1K4XCpMTd+DuXr2v48a3BgjcJL2c9PENw1i+haKYQwdZ7oY2EUKa0+2aRY
 jCvfeIalxRJT9lo07gAJn13E2ct2a1KpzAETEsBhoASrp4igU5xcnkSlnarEJsOcnks1EPJUhgy
 hNNSXI97Ph4/YlH8FEfLYPxtF5Q4tpXwGz6Sn4HO7BAAy9kY3/6L4aVhvNCR7XXn8jgq8awdn4c
 F0eZR3H4iSfjz1xQeXkQT7zNyIaRy8i1NWGhMC4S3zE8QiUFfIcLozm6ZKJF+D5kNgrm7PS/2Ez
 tF/zfwT8FKoKBiw1p9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:29:56, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update the CPU idle state name to match the low power mode
> it describes.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
