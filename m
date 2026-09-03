Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BCD3F3264
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 06:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417387; cv=none; b=oCu93c9KfNDzCVkSGKHFw0ILOJ3L4VHVBHdp6Lblk3l0oq8sav/Sac49Q87U+1pIqyGIu01/F8u+85Bue2m5MCdBw7+C8PfAR8K+/PpWXj4FescLpTjGSKatAHH/DmhRqyxWkH6v/KoismKQaMB410IKy2GyW8Vy5MQCCMPzv4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417387; c=relaxed/simple;
	bh=FfwkxEfilE86BNfAlLpk7Wh2Jy69VGToG2IRN4Qqqqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWn6T7LuUo24zJMOxntV3habdwPPwzJLwtXR2XuPJS9c4i2ZYmsQZ8FfoadGkyTsLBi/nqhyg8P2+nQa7XRELWdR9zyLsy17V/fJ8/YI4/kW7IWGY2k+sblKBsYfWIYVyJhks1lWnezNqmS3nOLMbQdwpf0sElWH0EACo2U1DJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enNaZKAL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hMUtYN7w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enNaZKAL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hMUtYN7w"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lea03642020
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 06:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6vG8IUyMgWi+NM+7asSaQVtS
	tMEa/DOfKPbDlIqaadE=; b=enNaZKALYY7Lcg2+BRZ+Wvyk+B4pcvlzWMrbcyib
	lExhVZCU4VRs1ZIRTaTp10fJ3BdsGzciWvB5lE1i2e9UjLiFd4f07sH6fFmRSfcU
	epkdfARqe26b/VCtW+ZhAOcjEFOGnzPODymRUIxhJf7v7LKIfUJWVvbqwHYjKC81
	r/cms3K+WFZdch8xMsyf1HmqmDN+a2MQ3bwhqvWZAJkq6bByZnQM26xclsH1poAj
	zyzIwYHPaPw4nmEHZ7SMvKveQx9Wrc95JL1tjxZB0VyJGeJnM5H7naTVaLKctBYf
	mTvhhuRYKpJ3Pbjdu2e+MseRFnxd57U7ztjlQooI1CJDzA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdugey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 06:36:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e375d9736so1765074b3a.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 23:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788417381; x=1789022181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6vG8IUyMgWi+NM+7asSaQVtStMEa/DOfKPbDlIqaadE=;
        b=hMUtYN7wagtSQcUnCIQ8Dqo2KR8OJ2ahs2dl3qQRbI1BoQRp2bFy/8xBxCltZbgo5D
         JuOGUAqw7ehCZGNtpc22sZI7WQ8xLgod21AWxzrkL99DmdRqsblhM4XVUEwm9wxQR1Vd
         ueR8WhysPzRWdoLotRXHlUhRs+rZlQZ99248dg9iQ2exquNxd5dmPYMYE31A/ERbMOdQ
         Ff2H6A6iG+E0TGqsYX7eOr2a0YONYezZIfyGBJF5sRKqjCdQIqI9jiaquEGdPCHM/It1
         qDDcMic0XDX/pJMSauOyXl7dI1M4PRkNE+8jY6GQXiAOyi98SVcTwzNfsVOaac+cFmOd
         a01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417381; x=1789022181;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6vG8IUyMgWi+NM+7asSaQVtStMEa/DOfKPbDlIqaadE=;
        b=oplzAOFoeAcfSzpAR36ZW0/BVipWK1nPX98DzxZdCGIy3OJBGREZMV3bDVyLC94GKI
         ULGjjV9IeodG6dLrcXDVg9LRfFeUvSZN1q4ySm56FNGs/X0tTyvTSqzIg8RQN816yryL
         aunz9K0VbkBSj/q1Pti6ZCD3OVf36ZCqKZvdOk79svVeQhb41WfTfXb4Jc/3X2pSYCgX
         ispkKdo0291iie6Cz3Oyi3uNlTpoxLCPD9RhaVRZuR//xqPGsC+ekJ3P8zpEfYnIwHl/
         8JI/5bZQxxgvKxE/D3bWLz1Vrlk0Hnr+CjBJkFYE7FUzGydykUV57XOaunInMUjX2164
         hy+Q==
X-Forwarded-Encrypted: i=1; AKwUvByDxT6A9Hc/3DS5GDMmbISt2go1asR9dX6NJzuRS5sn+YvEA2FrkNUva04fr/w00NmeNzvh4dXTeCv5@vger.kernel.org
X-Gm-Message-State: AFuF++mJlXwRq7p67dwQkvnlTsOBv5HDLIO889ldq3kgHrNtwjcwXito
	hK/4p87X1+secC2KBe37GqYBid4QljyYbsS4L2323+dm4kFO1rZkGUxdhafAiQ6WKwtPQsx1s6o
	Hxfakhd8yxl8ctfx4gewyN6Q+Ypq4PuEkrLlTz6Eekk83KTKdAZ7XZYJEpOPmoY4M
X-Gm-Gg: AYBFou2QbnpzynIGhrS++w1WcDd/fVUWGnFfeRI/g23nafiBvZT9a8GSWSx54ebnw1F
	tGBmHp2jgZ8HJ7+PNXWZf75grTmT86xaAfXRdeMGZ4Oq3SuTKquDxWgRmmSrbRuh3oKeiYMEWcx
	XuwZoxOXIkKA/VHux824UAP8MlJOKm2g43xpbqYAgedgdu85Xx/PDSRgWFetgNHkmENM+tQ7zVT
	yjIRLo64jnqKTGzk4HYC/PIbD4OpFGbBITaoyBw9PA9+eXocqioDZl3WOUuG2V9WJF5Rp36ikgQ
	v/oWMP9oPLAei0s2PFtlF/+GFyAzIb7+UTDe4FfOVR7u1PUlqmUI5oD9cRT4PA0ZpQheIU0/nDQ
	X3RFnhvfGDMHcgxISqXVKzXG7263aqSYqAKXLH7r6BPI=
X-Received: by 2002:a17:90b:164d:b0:398:c16e:69d3 with SMTP id 98e67ed59e1d1-39aedeb9aecmr15404626a91.1.1788417380683;
        Wed, 02 Sep 2026 23:36:20 -0700 (PDT)
X-Received: by 2002:a17:90b:164d:b0:398:c16e:69d3 with SMTP id 98e67ed59e1d1-39aedeb9aecmr15404520a91.1.1788417380155;
        Wed, 02 Sep 2026 23:36:20 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325592ebb3sm3645854eec.14.2026.09.02.23.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 23:36:19 -0700 (PDT)
Date: Thu, 3 Sep 2026 14:36:14 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: qcom: nord: Add PMAU0102 and PMM8650AU
 PMIC support
Message-ID: <apkVXuacPMqg9I8n@QCOM-aGQu4IUr3Y>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-5-shengchao.guo@oss.qualcomm.com>
 <b3ca88cc-ff00-4a6e-9335-e39bebedd548@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3ca88cc-ff00-4a6e-9335-e39bebedd548@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a991566 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KicveIkL9BD13D6TIKoA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: XedyTjXxhg2voLJouIleKHaVorR-Tb0C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX0Glyc/OFA+wb
 eTuNqaEIu1oIVCQK+FwWhtXpZhQrUZD6AMGQSBRNgFqyveY2dA835+EwxWHGpz1JrEHr7Vc7Mg/
 iZ8/zBmIWOyZCtungj4zPt6b3kkYolIYn94ubJsbA7VGzUU80QhmOl5Y+sqq2Xq9Igvk6L1yBe4
 J8Xoi9Ey6xsVGf4VOE4J271qpBqy1tv9Bk6xd+HK3s8CccLPyVJZZfgZtAGoBnSLyV6Qe7IZfHX
 EM8rMtl01eEmC0NFXrSRW/Vm0hvsLboLohjG2irRdL4VXWEVoTBnZOuy4akiudrOw8dtI6wzv7J
 EtHdm6SeAePOjFaZkxpSIx2XitKB0hBMamAOBBXI/wqbGKeG0GNz4a4pb+nhzfYASLhOl73lQBh
 gx+cN6lBFxYGdUEJAbwu6OeYt40S6eouGTxZK1bh53dXOcl9/dU+EYLEHwQcYOoYYFqIjWK1628
 2175kysLi4oAOghKVOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX72R0knooZd77
 T0MYvgj7TV6kyWThQIzilnFk3Fpkg4cG1ZF7jo9QRVrHKJA39PHlpfjFBsGL03M/BPpPzXVP0kR
 TPXxwI5bUOZAcUcK+eNxQge41Tty6OU=
X-Proofpoint-ORIG-GUID: XedyTjXxhg2voLJouIleKHaVorR-Tb0C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030057

On Wed, Sep 02, 2026 at 04:17:26PM +0200, Konrad Dybcio wrote:
> On 8/31/26 5:21 AM, Shawn Guo wrote:
> > From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> > 
> > The Nord platform is supplied by two families of PMICs on the SPMI bus:
> > eight PMAU0102 devices on USIDs 4 to 11, and one PMM8650AU on USID 0.
> > Add one dtsi per PMIC type, following the established one-file-per-PMIC
> > convention, and include both of them from nord-rrd.dts.
> > 
> > The eight PMAU0102 instances are labelled pmau0102_e through pmau0102_l
> > after their board designators. Each one provides a GPIO controller, an
> > ADC, and an MBG (Master Bandgap) temperature monitor that reads its die
> > temperature through a DIE_TEMP ADC channel. The monitors use the
> > qcom,pmau0102-mbg-tm compatible with qcom,pm8775-mbg-tm as fallback, and
> > each is hooked up to a thermal zone.
> > 
> > PMM8650AU is the same die as PMM8654AU, so pmm8650au_a reuses the
> > existing qcom,pmm8654au and qcom,pmm8654au-gpio compatibles while the
> > file is named after the part actually populated on the board. It provides
> > PON with a power key, an RTC, and a GPIO controller. The resin
> > is described but left disabled, for boards that wire it up to enable.
> > 
> > Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		pmm8650au_a_pon: pon@1200 {
> > +			compatible = "qcom,pmk8350-pon";
> 
> I think this may fall into the same bucket
> 
> https://lore.kernel.org/all/20260724-b4-add_pwrkey_and_resin-v6-1-41acc214d93a@oss.qualcomm.com/

Ah, thanks for the pointer! I missed that.

Since PMM8650AU is the same die as PMM8654AU, I would reuse pmm8654au
compatibles, e.g.

	compatible = "qcom,pmm8654au-pon", "qcom,pmk8350-pon";

Shawn
