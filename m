Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40935418A44
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376120; cv=none; b=jRYbVesc62VMeZAHJgGt9pxmv25guKaaso+Www+5E2XZ0cAuvRwyP5/HkKoowv5Q6PkleHv5MpyL2omulif+eSzIrhG8X6XFSOwOhYbgY/QvukhmlrAp6cobCx7nF1PSuw5861OpHA3OAMruQKIIu7yw6fiivoh/Tq9UnDv4VXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376120; c=relaxed/simple;
	bh=mBwpmAlf8UOj7gLdgmuGOkNJK6FZ3SWwkbTLju9999M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iIkxdnJ/tvyTk9+SwWnn4SdK9G5F8ae7FnH2Bx/EgkpaN6HzavqJ+Iesvs/E9m2xC7kZBZdMe94pXDqF0xM3kvsX+qze6Y3oHFVbPuEyMSDBAx8kJr0rcYubu/Pxbl9m0AnwDDROWWJl7ybSKaggkhzvr5PMcTDcqYcD5xCZNcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Su2TlkVn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DOpKL87O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Su2TlkVn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DOpKL87O"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iwiO543113
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	epaQStzDoArRXzyD8O/qeY+JFQbJLPFewZCZkmWYy3A=; b=Su2TlkVnunmo+PnW
	f0uDr/AI3EsrQIubw6Ud0xLUJ3BiwHJXAFO/T19rlUCukaNRCPEDNmWs2cvJwKdK
	62QDFHQ2KLTV7NqTY2CWX/meXZp3SPnCIDpAD4sZFewVH5hlvNZol2mJCo1BQhRr
	PeY6pvydp7k6B9lPQivYtZGMeRWmFHf2VOgKvNexgixOWkn+Rc4D4GrR4QGtJ171
	KOH05/6QX9PGtRUZj4wfwZI0Pj+afYjte1YHtYWLSZS3GJjw84x3gmOTzHFCm4Wz
	sByZMKsHhDrgtBcnowzxJigu9nzYPB8rX9UtHtt/cGyKfVztr9bK5gqzZDGHIHMK
	GpYQpg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k09nrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:55:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93102454272so63621485a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 01:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789376109; x=1789980909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epaQStzDoArRXzyD8O/qeY+JFQbJLPFewZCZkmWYy3A=;
        b=DOpKL87OtoMCIRbPV1XqjJ/zTBM6UQ7ZwK2wOdmdKUCqPkOuGvz3YIkvyQFa4THBVe
         1bA9EWUqX5fkwyA4kSHyYH1Tyv4t9pl8LtP/Hs0euvgA5YzWv5VerkYiQH41zBAI8byw
         +ZQCQECCfP4xloPw9K8tuAarXMhmixQioIMiRyFWaYTivQOKZX35Yh4XuyPcJ8Evt4nr
         oPW75iJXK2+caccCkkKll/Xwqr4nh4xTjqwhd9BaMZvMWXv1SReIZDfHQm1qVho+rBbp
         zDUEZRLeTGLUwL+o1pcLQD2+K9vPS+2q6bPgsvrXw4JnyteWLkmPtp28r22VpxOF57+s
         vWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376109; x=1789980909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epaQStzDoArRXzyD8O/qeY+JFQbJLPFewZCZkmWYy3A=;
        b=hcTF5cpmWYckh9BQtNeO6lX6yDtQMex/nNVH3ZSZe/MOFjFCIzrqOSZ1SSrJhZY0En
         ojeO8VLFd9Z8NCp3Zdi6xkgok1Dn2vd9T/+O4EU962BiPAFlEYQx9wXFbKeTmu7AdyBP
         1BOpUJ/V0WO4a5xw4779mWwLJ9/jgm5mhy4H9ALNg8iWkaZYdp3VdhuzTqjNLwtaOvHg
         mFwKbHBBdSNhioGj/sr4eDF/CTu1NbelkVIU9ICu6EAGQ3T8Tl8Eejx7lNypIsDTPLqt
         dxgKkoggugQdu9qdvzzcTVohPW0dVQishz1FfXT89IxSZlZyfhtFflS0eJ5NvBWPUmYL
         WpOg==
X-Forwarded-Encrypted: i=1; AKwUvBx01QXUNLSJefnjyoac7wUfTUB6DxD4+0pGjRlBKwhUESUd8//qYBJ6AORotJw8Sq0xrtbWauOmBc6l@vger.kernel.org
X-Gm-Message-State: AFuF++nQMauYcahNohe7HTwUzO8aVZDXdPV3Rd8JRZE9ufbSknJG8Eqa
	FR3QwclQwBnzWVs1GKcHjFVglfqTrN0sG0YnFU7+DXlKBGLbx9MuQn1DM0DneQAJ6VHVBpCOd5N
	56d1xRleW7Jg297GvgWXvPAXD8lzOX+5vWe+aHnaKOyMjDrLEoyULbhonw/djcSOc
X-Gm-Gg: AYBFou3r4Lt8Stq6kXIrJu9e+fgmLHbF/fad63KvBjGrUGG2Ejjelkf9qiQXNsZ3d0s
	aTQi4GJtDUWZaJn4AMOv1peuSnVINvMbyHAcg8Qkt6NmaNp1YMXAXOcI9XYQAcsUTWzT4h0ePP2
	jiBPthtIVve0HTH7CIcXy/p8ioPqVLC6nGEOhxufx12LU8Cc7q02xdY9OCgqplP6cKOoSjPa89D
	2gSyLQap2wOmcbUBka8h4gSEiI9km9Z3PDAYIyZnldxwcwKUIcnovJLn6BhhyI5Ghd+f2yuS2IO
	sDG6Cdepvxds9a/hck8I9qNPalIkkXE5DYxrAlxJmPY0tFUVwVTTb/jCIy+7dB1u79d8E4aq10P
	PNeqRCe4HoFIdKBFSSTGCxg==
X-Received: by 2002:a05:620a:2b9c:b0:931:23a:83ca with SMTP id af79cd13be357-93a29a3892fmr168691185a.4.1789376109047;
        Mon, 14 Sep 2026 01:55:09 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:931:23a:83ca with SMTP id af79cd13be357-93a29a3892fmr168689685a.4.1789376108674;
        Mon, 14 Sep 2026 01:55:08 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5914700sm3691780a12.12.2026.09.14.01.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:55:07 -0700 (PDT)
Message-ID: <b97e6ed3-a5bd-4934-b2e1-4838a65c798d@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:55:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: nord-ride-embedded: Enable USB
 ports
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-6-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911142040.100263-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyNiBTYWx0ZWRfX5DUg3Atb+PPF
 1O3GiJILY+wRyyMbucvVEpAtrq4UkR/DUl/7vei094QzEb6IVDJvTKBrLGYCB3qC+9XXdPb9OV1
 IpJuskx5dOUM1Zo+RcY5bBs1+AuFdq4=
X-Proofpoint-GUID: -IFaLGfHdRK-_JQcuQXbERzPnrlcXerP
X-Proofpoint-ORIG-GUID: -IFaLGfHdRK-_JQcuQXbERzPnrlcXerP
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7b66e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VOFYJ2K-I5rkPCBY1ycA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyNiBTYWx0ZWRfX9NR/TVU8mOHx
 ZFl1T5Yx8KiO5gsbzLKHGU6ZREnlzFtU+jyzUWWD5kovkErGDt/BwpikBg+laz7XrREcZULH8RZ
 ckI4UbpsZ1Gej3DSkz3lg2Q/DIeJFg9W6LQhdALYgr3Q0AVZp3ufBMUuSZjkwmAhAulwn/v2JY6
 jE2RTtEMX4G/klZmulVsxvqQb5RgJ9p5mP8hcgdoOcOSMxiEGFavFFVOaly7lzAwPSpWssomcww
 POGp4GLWbtq2rtdMntKUil5Y7IFmbF4gRmG+rlvw/SixygMi6bJsCQnsXll77WbtEtpcVGuBxIi
 tGTKgHrq1xxCxcZu0CM+akZVGWbjrIR3cIbHxYjRVLayeayGiEdu+GUnmH41CNew3kHD4WhM3zM
 ZnJeXKquVU3spX4YpgxTRwkBIKrksdsZY5kcYCbcI+AsgVKZu6eqEtSCO1MO05Jk3taTVUcE/vW
 aPovLVKbe/jSG/1QojA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140126

On 9/11/26 4:20 PM, Shawn Guo wrote:
> Wire up the board specific pieces for USB ports. Enable i2c9 and add the
> three NXP PTN3222 eUSB2 repeaters (one per USB port) with their 1.8 V
> supply and reset GPIOs on the PMIC GPIO expanders.

[...]

> +	vreg_per_3p3: regulator-per-3p3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_per_3p3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};

Can this one be non-always-on?

> +
> +	regulator-usb2-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usb2_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&pmau0102_h_gpios 3 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};

Could this be wired up to a (presumably) usb-a-connector?

Konrad
