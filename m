Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F57F30E0E4
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 23:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784416393; cv=none; b=Lbghncq72CNCuBDq8Xc/eiX1cOFr6ZJtAmVrErGvj4iABkyk7xZDZaDJ6egkCx0G+MoLVgsjT75ZcolY4fgurqS1kbwKEtTJ7D7IkxzAOELkTuIWJ31MPhxUPrhS3OhEoQsf4SUK16AJVWNamrXEHTEk29efG2etgUT5S0tRQKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784416393; c=relaxed/simple;
	bh=XfGCLLxXumq2OG+cXSSeTxfYIKiJ2l0/DQerjf4QqeU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HcvXcPtGn4qi2v00UvxJvrF2k1/LfLYHmFgEC+oigSWOIpOEjFpFsjSr9DzOugV4psuZgRr8rc9i44rL9vP1qdkuyhPiWsbPp+Vp94RDbxvSg6ydVbtXR8oImHOZIbsQn/T2YJgLp1d/yrzrnImuzCsYQP3WHctGcjKcgoBb0+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3Nz1++U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X/gWpX4r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3Nz1++U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X/gWpX4r"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IN3Nr02079218
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 23:13:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VkVRv45m5ANrH+FRuh+llStt+cQykEu8P33VkdTcs0w=; b=l3Nz1++Ujorn7GhG
	2sDy61Sgsj3Qowa8ZZU3f7p8ZcyEPv+GpgOVBd0lmDTYui6zYfjvMhu0BCdPrP9x
	tcDFG9+su8B+lcKJ5r5tOjZUpisQQTgZSijghhQhq0SvJMSnzd/z0lc8dD4LKnrh
	pPRNQu2JaCckG1Pt4fXlPbCSmP7C73TFP3oWRGVBGb/tavFzX5+B0Q3V0Vs8hosS
	7ryf5RnW38kM9KnAPXEhaVETRacRZc1RDpABToMlVH2E7GUBcO7fBMW1If17Xx4w
	pYD2u03+zD9jn9OgkOhYtsuorq64LiVNNoz0ANA0oETcpXd171Lc2Lwcry8F2ghW
	J4W1Sw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2c69rft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 23:13:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8485d853b08so7813029b3a.1
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 16:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784416390; x=1785021190; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VkVRv45m5ANrH+FRuh+llStt+cQykEu8P33VkdTcs0w=;
        b=X/gWpX4r6FWv0Im/sa2oO8/qu/JvUuhZrtzdFp3rjAJfhFlD9GDVuhpbwleCKjbRja
         D7Y+x45Cs82E+anqHBTru/v8N5F52UTDRHIio8BJluMwzBHuDK7nlENr5PDwJZiA0Dak
         qJ5f/EKz0mwXkHMQrr/6A7nkGcTRKC5uuqQ9+Jx834WI5rT737A3n5WIE7VE4Lp1PqCA
         1iGWi2OJ/q3Ux38xXihv7NjyUi3/9ZGKmjhLSCN4nGUtBJmtk0eE4VZQumJu7o2UpAeE
         R7/j3cCz5G2irC4U7uDkIzcrKJk9ydXxjWvKxhvhnoc+qOsOw3bSEt3QsmsDIgSw9SrJ
         b+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784416390; x=1785021190;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VkVRv45m5ANrH+FRuh+llStt+cQykEu8P33VkdTcs0w=;
        b=gFn0tTfFUnuaOhfpYVbdx1rgiHvEseb/yZTwrGmnkBe0gmCAscil1G7/8Hd4RRHj3r
         uBHaK9UikunXtv9BxzRMRdknx49NapHBPD9kwlVf2W0AHCfcv9bdYoBhA6LA2sbLnAu6
         4bBCNTeuPRMwdETr8MNCjYVKqzE2szhlZcCQMoSJaZ/go5KX4Gmb7FJ0o2ZFvwOE4jMc
         tTnRTF4YqdgckLJIC49169J+aSk+DZSSZy/7DpiAg+reG2FFakJnra2KIqUan6uIBi3W
         PkZeyoUCpmfSbs8D8aLx58AzkhNOQgiFkuo7rMFoM0iAAyXgz0wpmyvBUN35ooGxmobn
         8tsw==
X-Forwarded-Encrypted: i=1; AHgh+RrYHbBr0th1tXCezK7MaihEafLroPry84AF0FPm0l4LDHBGRjg7t/veeOzCGCZzID0qfU45RIL+lC8/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8V05zfTj2HYGDfZiwhqbfD/YyWxOvGHfynJocjx56CRT67NzE
	2VQr1VW9wppnH+E6G3SljKKKD8A32nyv/TDUkhqpwPM/sr78neAYESGsmcYGDxbbeFsNxhkP2NR
	Lh9zTiQ/P06iKrIzpvFUiEKQkcybvLP4Px4798sN7l3iIKgvd5Ubq766K6kO9NPBj
X-Gm-Gg: AfdE7cmE0Q19q7limyhA+xnaMN9fy8yPovIWv5iLwSAhqPAGM4nFcjGfAB9kUxvfAkM
	hN3/wkl7zxzDivJYCMtrHwzOHxmCtN9EfWKXClqwWSvDbTkXT+BlFNnwnjPfjj3qNhpZA8qrCU5
	21VmKQPdkQ3SPjkolMf6yhzT9ahd1TTl2Qi7QJlGv2v1s35t8EcPaOBk+651c4rPvz3W6lUVYSd
	HurZ8MdetJgfsfb+nv5zyfOGopLuHeo7/W1v2UVSU23j4oxyIJhLwJum1udqW+CXnEnieZikMiT
	PsxH2w0SLhxcUbr29RSFX5jGmYHCsUtpgnLqE2EA8uuaLZEchdfSkE7SJD0IktEQSxnkA0bQwBd
	NCmDIfOvq2aw8O1+i
X-Received: by 2002:a05:6a00:816:b0:84a:2c46:3fdb with SMTP id d2e1a72fcca58-84c2923a051mr8853191b3a.5.1784416389739;
        Sat, 18 Jul 2026 16:13:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:816:b0:84a:2c46:3fdb with SMTP id d2e1a72fcca58-84c2923a051mr8853168b3a.5.1784416389335;
        Sat, 18 Jul 2026 16:13:09 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcd3d1sm3249794b3a.22.2026.07.18.16.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:13:08 -0700 (PDT)
Date: Sun, 19 Jul 2026 00:13:03 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-iio@vger.kernel.org, andy@kernel.org, nuno.sa@analog.com,
        dlechner@baylibre.com, jean-baptiste.maneyrol@tdk.com,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        heiko@sntech.de, conor+dt@kernel.org, krzk+dt@kernel.org,
        robh@kernel.org, andriy.shevchenko@intel.com,
        Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V17 0/9] Add Invensense ICM42607
Message-ID: <20260719001303.422cf24e@jic23-huawei>
In-Reply-To: <20260716182637.24310-1-macroalpha82@gmail.com>
References: <20260716182637.24310-1-macroalpha82@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ny1pmCHKekLH0kal0iJTpmAMyjjq_GLa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDI0MyBTYWx0ZWRfX2e/hdt/NTKBU
 VfeqEb8h6A+Ei03kgK7Vj6fwoykKCtphpNsrhht1bhh8uaBtxWJRwtJQUNQfGYbfktL82yo6D2P
 3zoRqcsZFU8wXlxIwDYqv64yOhCTIFFV899Y23oxVIm69eufE+o73oggnBGRASA83xefDd5p+Jc
 TgFMEq3Y2wwR/5cAai24NrpXntskGcQDpNEKOHi8R+OD/qjFrzIjn0A/OGkfQafP1ItO5H/9IVO
 HKsEt/+mm2g0cXiSchfvMQup5rr36m52w8W8uzbqx6Pe2Fh0MGGMs2V/zStWgrtebY7nQxJ+snr
 tjhngn8nLcrNI2ya6UDTRuHw/fXOkWfCYiOZmxAOHZZ62VH0z3vY2fHYAiHToFU+0YqX8KG4ser
 ETQvpPTqfud1lj9Wmsu50BWNsAQxdzpTUvU+Cl2YBxvDRv4F2uYKijq410cXbQnTpWBOoEPGGHX
 4GeLosMRwHECnq47EpA==
X-Proofpoint-ORIG-GUID: ny1pmCHKekLH0kal0iJTpmAMyjjq_GLa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDI0MyBTYWx0ZWRfX1e+bhGX74afZ
 f3NWKrqsVz4MQKIUXegkXNIBBIFMC9rD5XKCDcCBIUcuZL5Vim96C11oTcN2xDQ23IbGptWeiaZ
 Nsjv13fmMyJ8qy7iHhyrSgqsDUqLfnk=
X-Authority-Analysis: v=2.4 cv=CJQamxrD c=1 sm=1 tr=0 ts=6a5c0886 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=69EAbJreAAAA:8 a=hUMHPH0LmMywwkxqrTIA:9 a=CjuIK1q_8ugA:10
 a=ZXulRonScM0A:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180243

On Thu, 16 Jul 2026 13:26:27 -0500
Chris Morgan <macroalpha82@gmail.com> wrote:

> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the ICM42607 IMU. This sensor shares the same
> functionality but a different register layout with the existing
> ICM42600.
> 
> This driver should work with the ICM42607 and ICM42607P over both I2C
> and SPI, however only the ICM42607P over I2C could be tested.

Looking pretty good to me.   Just that sashiko review and that one
minor think I noted + drop the header Uwe requested.

Thanks for persevering! Jonathan
