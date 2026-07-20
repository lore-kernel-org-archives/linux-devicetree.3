Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C08241F7C3
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784552579; cv=none; b=FA0jMBygFTFp8VcaRZpof1be2tiMs4tz7OAcnoo/P7VHW3ZHpOID98URA7ox33j+xRR/glFYGy2JfZCpkgXgOYBRJ50h4DXVG8aygRymsPGPeUvZZ5FAjRJ8hOnFA9J/bxJn34PSTuGvOL8viIv6C2OXDfaUdd64iw/lytYWMM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784552579; c=relaxed/simple;
	bh=pdMOhpAd3QfySMj4+ujDj9MH9p+yknuq8LDoUIxcHYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gd7AmaFd9990Ak9rqniDuHZDzu71iHbtBZM+u0MhOCA5LHaKzh2FScix1Tku/mfLBwuh7cPJlIm/ofnafH8US7onijLyWLDeDOGBAZprrKCMXsqUDDRBAV/U4Kaz0fOoEb6YnpKQ8KxgCDVJ0aqZ7npRG0y8XaQ502rVFCuJaCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2JlFOGp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jvA7qygM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W2JlFOGp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jvA7qygM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KAvRln3434614
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CLMqfEhoGvytSHTj4WrRSh8V
	HSOC2iqzFVkwRAui2sI=; b=W2JlFOGp1T20qkdiJF5EceSDoK5EweuOoSqFkTUU
	NigyjENVzqsWkunwefd+tpEnZxGQ2Wj4wnCU50gjTVnMqb2A55X2/TTcFjFHtBqx
	AOoxgOZJEMWe81N/OLwQMIV+ePx0AA7qxNz7vce9vXkOOUzrqyjxRH0YUVgi8599
	nvoiXYJL/G6/WdcKpqMI2m0WNuF+KrxZatyd+Es84YoQnOB3/6gaWrRCViiLO8oe
	2lpq0uhuvKdLB/IHM8iyMIduCIUPuR5EbxNZ7IlL47Tq8s7a/Z+fUfIjmiVO3HKv
	VK+BkCpElLzGojdJ5sksynGv0NY8eV7QlIvOrQpSXgqJcQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfpg1c5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:02:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so5239776a12.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 06:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784552577; x=1785157377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CLMqfEhoGvytSHTj4WrRSh8VHSOC2iqzFVkwRAui2sI=;
        b=jvA7qygMCFevUU0UBDRvrjuTEc5uUln0+eD+VvnQe24JPiWAEh6zbKI2sgpMS2ZSUj
         wFo3BFgKHb6yMDKB4mcIh87G/PcIe1um8KDzJPtrnVa+GljwuG33+bksnJcW5HwBkcqQ
         VDgD4dmxFBNHFkR241hXcQ0b6ytl40MnLwI8AhVDwcmvR+bEi71Lp5auAk8BXkjG1B4z
         fKm7ErweX7RJUdkWY8NvelIeMGjLQHkmlQSd4a6PrsI8bDoV5RmoCzIiSBQEX8OJ/eFG
         bPdZoBwTYW/FjjuoBl6Rcx9+Bib3dnHRFyyLpjX9JMmaIDtjAMBmsfgsLifJP8ZxHp/s
         wcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784552577; x=1785157377;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CLMqfEhoGvytSHTj4WrRSh8VHSOC2iqzFVkwRAui2sI=;
        b=S846obcamPD1k0GhSBIfL5xH2W7MjK8KVHkyAqEDfW/+u0icjdQZ8/loWcRIqLur46
         t7WH3T3ijZmg+FB22buz5FDV8LvjERwJ9TMhnnYDkLWJWxVLhaxo2YPCCbgH7kPGXMgI
         RlQo9sRK+DnpUAbNCoGZd/j63uvi4q85r3ZScM3EklqjSSPEbfMxul4E4r4LqrKeAryw
         rx3oMQSF/Frp8eh/Ut62Lpk2+wWnkN4WFkq1aV5QRvpe8TWP+o3glvLoUznK6AXW9f0e
         B6ehVkhQPj2YSQhCVgeADPH/U56IjPZ+wXxkZ7v49WJyFViDw4+j2N5R7r0Jp4fzQiYW
         hrdw==
X-Forwarded-Encrypted: i=1; AHgh+Rp3uqDuGfrZI2p25AezH7OmZsuiD5Q3UY3Xmd3zTrb6f+4CH5v+0hhfbPP/j3bpQRcLQzE55V/ZXxju@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa2EarRWCQ56NedJ4TOFaGUnob0n3WgW8QVE4pNOhx66oITwHG
	ODzm6frlUgN39ySZ2PMD6sUSzmZAI8KrpN8PC2mBuyTAW5ZiG9hSMJD0sk6lzfWbDVgXnjrNTe0
	J36DzImvpV/s8KGez8I0CgQqB2nbTL3bdrRBT8aajcJibM7WvOh1q5SUbAdysKao9
X-Gm-Gg: AfdE7cnfEhYrX4yXZCHTuSM2ki9UGF/r21EMWs3b9MWpuhelTLcCgb0ZFzn8aePfe8S
	AAJvmgin1YCPIYvhTztI/IbWz8H0g4PGkq7zbGb7GvQzbg39l0f+vrilRE85iaDxySlsDUCuqnk
	h8pDst0qL0Nrfy7FpMbvSGpTZBk9N99fGkHj+C0LIA3l2m7mSHKl6tPy3XGclh7b9gQmyUZJQ+9
	KzxFhqEN7HLPs2wB2D/1zZuzunHWe0YevUoyW+W+8xhJXV2hcC+RUfuw8sXPvVpoYsyKXl6ZuV4
	TruXN3BvaS3Fc1Yav3xjpA+pG22+JkzK6EV007kP/5ErHS300aI52iUBOyFugBmN0ewYVIQEDYy
	1nygzF4HUeFc41MT3rKWbQdcmhFMl3mXHXqDeo+mJW/Y=
X-Received: by 2002:a05:6300:392:b0:3c3:d199:86cb with SMTP id adf61e73a8af0-3c3d1998bf4mr6719093637.31.1784552571738;
        Mon, 20 Jul 2026 06:02:51 -0700 (PDT)
X-Received: by 2002:a05:6300:392:b0:3c3:d199:86cb with SMTP id adf61e73a8af0-3c3d1998bf4mr6719039637.31.1784552571151;
        Mon, 20 Jul 2026 06:02:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bb77csm40895117eec.18.2026.07.20.06.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:02:50 -0700 (PDT)
Date: Mon, 20 Jul 2026 21:02:44 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v6 6/6] arm64: dts: qcom: Add device tree for Nord RRD
 board
Message-ID: <al4cdNAV6JdnmucQ@QCOM-aGQu4IUr3Y>
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
 <20260716142605.2398433-7-shengchao.guo@oss.qualcomm.com>
 <b522c9b4-4944-4fb2-94f9-bd2553690901@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b522c9b4-4944-4fb2-94f9-bd2553690901@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE0NCBTYWx0ZWRfXx5iBO7XYaL0u
 ScRxA7uUDhGvjvmZ8UUAjCSn43+4lc+SAXCiw6hOS9GHS0JpU7zBa4JNFoSiBzSWCH108UOR9Ri
 5zemKTfibwOw49etZ7tY2n02ZOJcQ2A=
X-Proofpoint-GUID: F2LbNnX5G1kzN9fOD5lbHBvqREf8o3fR
X-Proofpoint-ORIG-GUID: F2LbNnX5G1kzN9fOD5lbHBvqREf8o3fR
X-Authority-Analysis: v=2.4 cv=c+6bhx9l c=1 sm=1 tr=0 ts=6a5e1c81 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=yiVUS2zsHPonJHfjLMYA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE0NCBTYWx0ZWRfX1KTF/mZvTZv9
 mrWqkSVTdOELUauAjcaL2MjKcNn+r8Cr9hOSdYfRxQpY/AM6KiU0n5NrcE9a58mioNIi6SrbB+4
 1Rtrj+GelkUTqMejUOB0ef8S2iWC+tMIlIw0qOBfE5DIyoGg2yW57obtnj6m+AXygLld7k/p0Jr
 yFlT5ejxW/xPZE9UjMK3WFnau2JjjF/U2eltcNH3B3C4BUP/bE+DOh3UKKls/noNg6zKycNMBkj
 6sZD3eU0GAGrNMoA19EZKoWtXHT3cWqffMlcAnQM2hAAe6zm6VRAmre9eSxsjn5wtBtqDoX4dO3
 B71a5Cl3BxZaAwryXt19D+KwP3sfw8Qu+A6jwxC7IxPSrM3uY9ll5ps0+HkmQhERV1vkhTevXiM
 sCxNUQnvHM1VEL1j9v3VAhmy2VWSvKn9VZ+E0W76/CCnuHtCgJ0LT8IbFKfx1LtDaEQceE9a9Cf
 buKsfo0pOXygTLIj4kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200144

On Thu, Jul 16, 2026 at 07:17:14PM +0200, Konrad Dybcio wrote:
> On 7/16/26 4:26 PM, Shawn Guo wrote:
> > Add initial device tree for the Qualcomm Dragonwing IQ10 RRD (Robotics
> > Reference Design) board, which is built on Nord Embedded variant. Enable
> > the debug UART, UFS storage, PMICs, I2C and SPI.
> > 
> > Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	/* PMIC A - Kobra_MM (PMM8650AU) - SID 0x0, Bus E0 */
> 
> This comment is very useful
> 
> > +	regulators-0 {
> > +		compatible = "qcom,pmm8654au-rpmh-regulators";
> > +		qcom,pmic-id = "A_E0";
> > +
> > +		/* LDO Regulators */
> 
> This is much less so
> 
> [...]

Indeed! Will drop.

> > +		vreg_l7a_1p2: ldo7 {
> > +			regulator-name = "vreg_l7a_1p2";
> > +			regulator-min-microvolt = <1200000>;
> > +			regulator-max-microvolt = <1200000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-always-on;
> > +			regulator-boot-on;
> > +			regulator-allow-set-load;
> 
> You made a lot of the regulators always-/boot-on - are you sure about
> each one of them?

As Bartosz replied, we will drop always-on/boot-on from vreg_l3e_1p8 and
vreg_l2i_1p2 regulator.

> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> 
> It's commonplace to restrict regulators to HPM only because not all of
> the drivers that should be voting on desired load actually do it. Do
> you have any intermittent failures, particularly around PHYs?

We haven't seen failures like that. But to be on the side side, I would
rather follow your suggest to restrict UFS PHY regulators to be HPM only.

> 
> [...]
> 
> 
> > +&i2c7 {
> > +	clock-frequency = <400000>;
> > +
> > +	status = "okay";
> 
> It's commonplace to add comments like:
> 
> /* Type-C controller @ 0x15 */

We would like to drop untested/unused I2C buses/devices instead.

> 
> Otherwise this lgtm
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thank you, Konrad!

Shawn
