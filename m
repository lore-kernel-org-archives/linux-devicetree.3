Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD323FFD
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 06:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784184464; cv=none; b=ltOCjAIngImIBOWfXiL6B//JPnQe53o8AQzIRvaFb93p4QJv4Qrf3ws6L1/D5puRQ8hc6zyuGjG1o3AR7ThVeUohFX17yaFoX5GTAvGcWOzgnINeuO72C55n3hmg3ZrS0YDvh05rS/T9W7VOz54t542hrihwsEkewTacRGro0e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784184464; c=relaxed/simple;
	bh=qAMiaXRikbhi2a8I0S//Dr1NE46jknV8BsFBBvQxi+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MwUt2PqJTZLfMh4BmJefDWVyWcawQBlpBf9fjxSQNpKbVfOweR+2tQpMNckWOXX+BO1HqVmzVmisOnB50rv/vll2cUZnJYhwlt2bB4b0pPqVGsO7xtcxbbuq/MT2E1fOUtLTVfPIi0Uw9TaH3EK8HHWqfAkqD9sYTjKCRQFT4bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TDjrefrn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SfwGohBw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TDjrefrn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SfwGohBw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wPWR1451752
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 06:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YaE06lxzdsOzAYkYeqtz96/h
	FbOKK6JdCC8M719sNGc=; b=TDjrefrnOafTGzCWgD/1CRYrVElUVPHJYp4GwxhO
	cKmxYv28iEGbwooY4Py45V9cA3KknPHlUfPGxtz5U82LnSN8fdpxnvW3SrHT1TyU
	y7joCi7MV/e1A19G2BBuN0QJTBn15yv/TQtxrQTITXetpka6oDH3qZSEb7wrO2gT
	Viv3eWthuyQUjWtF9FIEOnaA2SpPJfkrLLX0duAB10gvLsBDZ/HqCEaAKlmP+3Ou
	HKp+mrKnIQ8kOAxVKHDy/wZZZ0ntg08vxo+9RTnXnIhES3gB3x/nwecf8tH60/aF
	1cl+zti7uyh3+voVWXT+6DZMPPYqfrO3q0bunBTy8wV1FA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fecnyb23d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 06:47:42 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso9145996a12.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 23:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784184461; x=1784789261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YaE06lxzdsOzAYkYeqtz96/hFbOKK6JdCC8M719sNGc=;
        b=SfwGohBwf4+67dZZ2AFXpb90RcO84BzM6bO/RT1IkoB4QIWTcXJ3NKK6KvQ6C6u6kH
         x4YSy+UxhsU/GR68gZHl/5L/Qoh/zmARuJj4tFdrbWD9Y7/iMpRQPvk9H8C8IUqt6FM6
         c+dQeqx2TWDmrZqZk5dV53oQLTwm1PBwqOYR/v3bhVD9ngfPY9hS5mj0mixSJm49WGeE
         yHcxTj9MRs8MvRm/p55UIXnoYN/I3oDNaWZGJXTb0+9QVRDY7Iu5nEcduUHfu4tlUBE1
         i8JgY2plKxNxmLslPFUftiL/IcpjIVJuuO8cv8IH2DuHx2n7K3EvQjAcgoW1BNi5RHqo
         whxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784184461; x=1784789261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YaE06lxzdsOzAYkYeqtz96/hFbOKK6JdCC8M719sNGc=;
        b=JbUY6J6s2qxP5Y1MNpgpTpAPXsQo+i2o9wf4Wo04kayorGJ8OsPwPYGoPxoYF+A5jf
         dRM6VCte1ouB21/fcApIXewDAxVEu04bWw6VLSko/erhHC3CVgbkQgtpvZsn4p2CifpH
         D+q5TGR3WnXIq4GbmuRiLo97ZsEf96wEoA1V3n1Yod0JqS2qctgnf693tjgG1+oM40o2
         ObgkyeLoGiLRxu5qWAG25InCuryHM+MxN41NqsJbDX6sPTA2ySVutPCaRkooYX6WArDO
         IEFqLRiYQVzmsFjGhcqxYiesq9EMBUR2JFjcU7Yt4zd3kzilXxe+y91u2nMP0BbAzX72
         E7LA==
X-Forwarded-Encrypted: i=1; AHgh+RoOaBTSnJiMYPfsSq8olZ5NiobFNBmGELypA9eOHnnegs2GTM4MtCp4X5nGUUGIcxL72Nyav3St/+wc@vger.kernel.org
X-Gm-Message-State: AOJu0YyN/5perOwcQDKUlOavZOSG8g3BMO9McPxiCP1Jae8Bb0xbefk4
	9oNhTfGVHuxXlzkaMtvOmExYgPTzOVvq/O5480DmVXR0asw9E3wzb1WIAdutNk8ObqgsUszhyJ0
	O0O+nL6zIdIoc8WsXIkOW3IVQ0vohlUsE1rKmHx1McNHM6tCF+9akIy4H0xnNXu4A
X-Gm-Gg: AfdE7ckfinO0uvOZLkJh0bNBpAeB5VdEP1mCJIHxdIqWDPJmthUWtLpf0LPSeTSh1x4
	B9B+a8l07OZql1nxJhhdfpOAcRRFnDiajwu8JqkyYkrT3ekr/9jukedVVYfFw3xm/Q3A9EPWUwA
	UrWdI2TswOIy0nMhKJhTTfKoFuzOi4r7SdoeXXCWTcX5u43sM0f9X/CdgiTdcniaW3FzABjwZBM
	wMDP0Ybc/7pMhmRExM3aT7HgLjQeV0T+/sUixsqNCMMpitPPsSx5v5mPumg4oBkGYO2MvxZSS8S
	u4DpYC/yUMi9CaMtEGW58W0TmX4AyIHq6Ox4yizCfucut+hidsBB+s+Y7D6nHBTrsJk5gIpQ1jD
	1hjqIZMgfKNTzy6jzr6I5198hE7o=
X-Received: by 2002:a05:6a21:2e14:b0:3c0:9c19:65c0 with SMTP id adf61e73a8af0-3c36c4c567cmr6578850637.72.1784184461034;
        Wed, 15 Jul 2026 23:47:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:2e14:b0:3c0:9c19:65c0 with SMTP id adf61e73a8af0-3c36c4c567cmr6578813637.72.1784184460519;
        Wed, 15 Jul 2026 23:47:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6e9edfsm8110337eec.28.2026.07.15.23.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 23:47:39 -0700 (PDT)
Date: Thu, 16 Jul 2026 12:17:33 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Md Sadre Alam <md.alam@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Enable quad SPI mode for SPI-NAND on IPQ RDP boards
Message-ID: <20260716064733.3nzgioduu7kruglv@hu-mojha-hyd.qualcomm.com>
References: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA2NyBTYWx0ZWRfX6LLQU5KQjRQ/
 MbP0woBee7HZ1olBmYn+L2svVbPy+ACWPf3ub1MURv5FJTrL2diCQRJ3FWbmqd6stUbcnScf7VV
 X1kKvPo0jP4C0EuGHqCMGonT+WWclkA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA2NyBTYWx0ZWRfX28sW7MJb5CIk
 eyKu5XuR6LsAzFqUAwslQdsEyC87lgudCZwfMPBm1wRQTgsRq28UqU4T5FSar2UNGePPk96ihni
 PDbzyUiXubA2rbvv+1bDcnRCr8niIpgkljA3tZEJfs747TL87//oGOKe3z6y5tV0y813dokOA7g
 uyHgewckfr8dRdAh1UOKLukhUnbBWhYIsQX4VfC05E9kqiwBTu+35WmrlIH+SMeG0ot26IU3368
 /vuHQ6SGlO/QnaZ0yNxcdOcqrMahNlLWPWwQ0WVxjJonjiUlg/jcy/tetrNw47ZSafDBPo6JeRG
 cjFLIpq0ORKey3t4dZQKZ2xLn+2hxmhrPsud0S8boJcXiWKAXxPDAH+34tgSRqLcaOd0lNG75tb
 XgRTB13+2iecFr2TVVWUlor1u14ZqQe3wziCJfpOMfyyql3ik0m0Nlw0XNFSNTtv/roDOIRiWBr
 MkpS/FGaIPMhSl9550Q==
X-Proofpoint-ORIG-GUID: FiGr8Gv8ARGKE5nxVYb-ruhv7yFwCHuD
X-Authority-Analysis: v=2.4 cv=Lt2iDHdc c=1 sm=1 tr=0 ts=6a587e8e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UvOjeE5WzWDoS12IaKkA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: FiGr8Gv8ARGKE5nxVYb-ruhv7yFwCHuD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160067

On Thu, Jul 16, 2026 at 11:25:11AM +0530, Md Sadre Alam wrote:
> Several Qualcomm IPQ RDP platforms support quad (x4) SPI transfers
> between the QPIC SPI-NAND controller and the attached SPI-NAND device.
> However, the corresponding device trees do not currently describe the
> bus width capabilities of the flash device, causing transfers to fall
> back to the default single-bit (x1) mode.
> 
> This series enables quad SPI operation on supported IPQ reference
> design platforms by adding spi-rx-bus-width and spi-tx-bus-width
> properties to the SPI-NAND device nodes.
> 
> The series updates the IPQ9574, IPQ5424 and IPQ5332 based RDPs.
> 
> Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
> ---
> Md Sadre Alam (3):
>       arm64: dts: qcom: ipq9574-rdp-common: Enable quad SPI mode for SPI-NAND
>       arm64: dts: qcom: ipq5424-rdp466: Enable quad SPI mode for SPI-NAND
>       arm64: dts: qcom: ipq5332-rdp-common: Enable quad SPI mode for SPI-NAND
> 
>  arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi | 2 ++
>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts      | 2 ++
>  arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 2 ++
>  3 files changed, 6 insertions(+)
> ---
> base-commit: 19827e7930a5511c68e12aac6e4522f3661a1709
> change-id: 20260716-quad_dts-6bac0484c08c
> prerequisite-change-id: 20260716-quad-ec2765317214:v1

Above does not help.  Be explicit here in the cover letter by
providing the dependency link directly.

> prerequisite-patch-id: 912ede01168ddf0476ba69ab0db786186073f817
> prerequisite-patch-id: cdb88acd348e7dc5136fa9b94cc06dcafb0f478d
> prerequisite-patch-id: 932ca3dc3893df6de25928b24c7c24550907088d
> 
> Best regards,
> -- 
> Md Sadre Alam <md.alam@oss.qualcomm.com>
> 

-- 
-Mukesh Ojha
