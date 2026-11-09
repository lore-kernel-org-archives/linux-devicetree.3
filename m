Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213434;
	b=YajdtjCPSKdeP7Igfp5uBBnq1JrjLopm3rg/Ju9XcEqqRPFysXzZZc+lI/ZDNsiFy3hV
	 /YtKFq+Ifw6CcBrmYKJrc5Ff9MrZNDipFlr1g3sdhYEqTNMUsiJYDbtS1uDMoYjToGMPD
	 fkdVw2y6A181mdwkNVMhU6vkDiVMhUe6l2rQKgMRX3+7qqPz3QFa1y80Xvnqt4zTSoNrH
	 fiI3jJ3mMcg9gybF9tiR6jWGWX3c4t2W2KrBOI+Z3I3nlF9/4DEv790FKu2Lf7epBHkSn
	 sit5ufwlQDbS+31Lm4JWv2YkR8i1xfec3GcZg6KLHdpwpcEl9shKWCuX/1snux6kGYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213434;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rL3BzTsPRbdacfMmgW4kuPbKSzAfAI6zxuXuHJ+eMAI=;
	b=usybD4WI2AYgsSvU2rTQ6KMIchbwr7KTQg63oMF03feNRSSPR96L6TppBIUmCqtXIVaw
	 gwKT0jyjYBOXS7y2e8zMoxxc7z6ipGDN2y6wHVPWGqJdqVe/XhlRAR1HOEo4/xZV/Wm8s
	 AfC7U+o9jc1v2s/VCy54L0IuFqX5IDkjS8Qz2LAXsx80YbtI1mRcJAJq/z//+lS5yhlX8
	 Jr5Xv1HPtBgCh5R4z4oE0C2hgNCJjryS09g518j7bJFkbdLAgu7DiHAXvwyta4TBc/J+D
	 mFcYq+5ACehhLHriYm5IRnP3RsEs9NfwUfNbOZh/if2vHsrV9mPaXUMWQ3AaPp519mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bugPY9ZZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Ng7/9hzr";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86985606A322
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 08:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86985606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bugPY9ZZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ng7/9hzr
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A6ga2540107
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 08:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rL3BzTsPRbdacfMmgW4kuPbKSzAfAI6zxuXuHJ+eMAI=; b=bugPY9ZZO+xDwEYv
	QOAeANmpmkJ/JaJ4BFirK3JeT5RiLehMtR0B/YBUvx9yhLxHsYWtKiW4OGdTvopE
	VNJFd9clAYs3gWM9DNWS+uqRCVRI8tn/IUKlH5NcgCntYevFWWaQR75HA/48tofQ
	JkThpW+0eOfVrvDs0MEMuf1UwHIxtHxLDkJceEIQxqlkFjKCp6eePpiM8h5M1259
	xRCFvoF5mqATBtnHWWoIYviaqjudJkk4BfLsR99fWZZQ1VaNXspLEeqI2sXsuOF3
	WVTxVGzdVM4CGUdVv64yVkpTNROgy380dQSZmuYEOCUhnUh9T3fQLFkuGTGyMjsh
	0CycFQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvc6ndm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:37:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e92aad34aso173143485a.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 00:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213432; x=1794818232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rL3BzTsPRbdacfMmgW4kuPbKSzAfAI6zxuXuHJ+eMAI=;
        b=Ng7/9hzrwu5BLi70fySe1RjoytG8/2grOghCbGw700xceH9CyfgervCt6mlJ7QcOOI
         QOvbWMmSq33CacOj+a8hoCA3RNNXhD9wtYeyJDKHS1D8Pxfuf/7UJGWSpLE1cCpwv6/G
         /57R3L+pv9Dvss/rWmzlaqyNx2ErIdM+C4OiKKYNA7d2MrQOKh7PSuBVXIpEP7OxtNno
         i7MFC9okHP8rhEZjZuctf1FRRKrvDU+JYWt6ZNFuqQl3mRgrak9M4smC9lyPB2/vOwhY
         kwRJhERJ7mIXBqNC11ZQomOpwI3+Xw1piMJYNkAuh+fZpY3AVsG3Rw0V/hPICjRlMYrV
         P3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213432; x=1794818232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rL3BzTsPRbdacfMmgW4kuPbKSzAfAI6zxuXuHJ+eMAI=;
        b=e6QKJUUh6hzI5IRU/DkUVSrS/iPjsty7/f2qZVzUCqQnknM/hD9ae9Z+AfAoMB/puD
         NGIJzeZDHsjeDpw58pgGdLjpQulmueXJMyJu89IOYA7fLDnGESLkdgIhd9nW16H7JiqS
         i72l+FeqwRbMyEKyffz/zK4EZNZjN1GkfK/fd20JcTtlfNDmOoBbCR6mPLlVmRj2lMy3
         GBJvQtB06yPgBDSKSjA+t92hNZ2azJnQGXd7eEAGd34sHBx5b5peyUfv/AVS8gvlROOh
         RoOV7IRSlEwMVL7u8BuDtuyqROMQmeqzq8wM5ZDtDGFP8g5yO6o5ebeelq+Crm2iwUGq
         iRSw==
X-Forwarded-Encrypted: i=1; AL+hErEl0XS+VcnFtcSwEbsjBtSsnE/2sUq0J5nskmSGu3Qybhacsd1AVKKGyS5m9mXixK6DpCbMq31iT27q@vger.kernel.org
X-Gm-Message-State: APuU4Z+AO53AfGXutJcWB8/cvIUgloXEmG6cSSrZNE60iTeIeb5Kwt6v
	sJAZmFU0yACfkpC7u9IFiPwF607AC1M2piS0cyeH3MJVmFA7upmiBHF8G9nX/EDH+bhoeIh4umW
	aDcdCNRyAEbM9oac2n51ne7eUQH2XMvuuJ9ApxRKTCZBvykAdnJupOyfZ/Zml8i2j
X-Gm-Gg: AYBFou1g3ztTvAm8VjgW0APbfMc8wrLD5mQFMvJ6dedYUV8DVg6JadztcdUrKvMa9u9
	9EXusn3UrY3ZCzG5sMbxmExSSJi/27HEOgEilnQemzsRZqTbafcCRGecL2BlS+1feGw2/N78sNZ
	5AZ3Nq1PTAJ1Rgoa5kkdY7BNrqyrs/zQGvnl+knnu9cdrqOUvYxQQ/zEUXMW0+YTr0zjmDKKnJM
	a8euzWQYUnbn2ilPfZIgaW4nnF+1xg2E8Gsqy9jh4IFulLFl4k8aGJ9e18aAwvwP6KvTJTcfN7d
	oNdu42zqieZM3mPkamre9XTWFMVxG+G9KTO3rzLif8eKhOuQxhAQIQMPCfsjAuA/0gY7JToS4oH
	s8+H/N32wSc2Xt7MrlklqpHxO2VLR/WPE/GAhTJf7NbzV8c/ZnYpUU0UVTzlDCQRwM1kC8VrnYw
	FZDMc0Rs4L6Y+1nKPlYi5irocW8OY/ywUGXHw=
X-Received: by 2002:a05:620a:a18d:20b0:947:8f05:39fe with SMTP id af79cd13be357-9478f053a98mr202379085a.77.1794213431775;
        Mon, 09 Nov 2026 00:37:11 -0800 (PST)
X-Received: by 2002:a05:620a:a18d:20b0:947:8f05:39fe with SMTP id af79cd13be357-9478f053a98mr202377085a.77.1794213431241;
        Mon, 09 Nov 2026 00:37:11 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94782dc37e5sm418223385a.34.2026.11.09.00.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:37:10 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 16:36:37 +0800
Subject: [PATCH v5 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
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
Message-Id: <20261109-msm_gdsc2-v5-3-4a3159b5e4b8@oss.qualcomm.com>
References: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
In-Reply-To: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Joonhoe Kim <26rote@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794213397; l=1333;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=d8njmLr7CV+srDgKgb/TI5vSyT8vzzb8i6MXu/trLH8=;
 b=Lpc1jsqk39ukAc6Ha3p3NCpFtR4N6RWJAnPu3s7VJuOwW+CSKXIHIBpWmc/Ry+SyF04cgdHW6
 0UHN/K9ayQcDPV6pRIpXeSacvtn36fRImuv5AVBB2Fl9pDrWPlIHDX9
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX9rsNYwEw6gI4
 v1cQudETWjnSWai5kK3hH7mHj3UiwczL/3WPVY/uzPOR7aB8v5KR7qbKVlJiwTKvq7h51Zmm9WZ
 uU9/iVWEwUyZLQdKF0fQqC8s28e99xBM1ZEdZcnsLnl+a5B4qgMMIjX+Q88JN+KoxFGpxONsLYe
 wCuGqSe8nG96Ky8vmWdjymNMIhM/k4iScM24SNfIMf+I7YSybxUWJUr4t+p6OK1AGaTFuOdmRFY
 FZ1ZslTMtJuei3HsSSMpXabRGMXNhK6+wZghwmYW6B+FhHpai3LJINEnbON6gwykZeYgG/WyCjD
 UdXPBF9Yef7xR2PoznKDE0dBRbVecX1SRv8oIKaJvpJe2+J6FZ0LIKsmRPtsbaPlilo5HCz5hhz
 HjxmAWjw35i1CgGHI4UgtgPX8erJvnxg+R2U47VNVmnPAm+kZVN4x7SkAmwN7vvYCzF/6pggRGj
 ceelgRDZMcGi3g4npgg==
X-Authority-Analysis: v=2.4 cv=WOjqzXsR c=1 sm=1 tr=0 ts=6af18638 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=GwFvbCpr4qPuEswRa30A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX1c8LjH8nKfYt
 UJjmE/OQyFYKYKTxczzUp26TwBketVKn1TCFt0h39dZfImLALd3IqKeHkRn7m8TKWv4TRel0w75
 Ek+z6NiZCWtMA1ahtdiU22GGNTFTkUQ=
X-Proofpoint-ORIG-GUID: Ax5t65K8AxkvLvqhJ1y3VEH5HfjOpP7y
X-Proofpoint-GUID: Ax5t65K8AxkvLvqhJ1y3VEH5HfjOpP7y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

The INT2 GDSC on Kaanapali (SM8850) powers the VIG2, VIG3 and DMA5
source pipes. Without enabling it, these pipes remain inaccessible.

The DPU is supplied by both CORE and INT2, so describe both GDSCs as
its power domains rather than attaching the DPU directly to their
parent MMCX domain.

Keep CORE attached to the parent MDSS device because it also supplies
shared MDSS hardware outside the DPU.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Joonhoe Kim <26rote@gmail.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..98d367b9dac7 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3674,7 +3674,9 @@ mdss_mdp: display-controller@9801000 {
 
 				operating-points-v2 = <&mdp_opp_table>;
 
-				power-domains = <&rpmhpd RPMHPD_MMCX>;
+				power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>,
+						<&dispcc DISP_CC_MDSS_CORE_INT2_GDSC>;
+				power-domain-names = "core", "int2";
 
 				ports {
 					#address-cells = <1>;

-- 
2.43.0

