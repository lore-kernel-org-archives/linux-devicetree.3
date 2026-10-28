Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194045;
	b=UbzwqoVjmSve46tWSzr2x/pQxyDpi33G3CrC/pS5pMtYCn4sUrB2WwbrXq3W4ylz9UHy
	 trcbwOeck0UUL92uVgjoqhLDitn868T+CFwnyxbPWqeA2IS/Cp8iBcpJaBDpKatkDdBWV
	 9ZlJ7ffSa7JDCHJKfoinw1Gt6p0vVhR162Ixhqo7FYfLyhSlTsa4kAQw1PhAY+etRt/oh
	 kYnTMZdCYZV3pQ9Phb7nqm66b0CQbu9yb/YdTX0kM4YQ/+EbXtw8GltQ05m9uwFCt6m/Z
	 2iM+9sVVHr0UCoM0shO7ZQITJyQV3eHSA3Ovbml5lOSfq7oR3OC8byZbTSh09g5Gjhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194045;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+mVvp7TjbMKQWDHg7IqBJlBTx3ZQ6XoSxRPaCYFhPkw=;
	b=pyJ9g8S6e37jfIjBDTfdmWkwggCJlh6u+ddXVbbgNzZwUETwiFQs3a4G6nclhkjT8Sj9
	 OXgJx5/r6lJRoHMnwsla+iYMYHrTNEo227OCik8ZgBelcbLTxw54yU+5zwL+BIy7qbhtq
	 aYY/NlSc2WuvNEBYuSNkRws9b3t3X6vvZRh8lwzAwVHJn/xG64e+d15761tVCAtSRaIYv
	 NcQ8zE4Dexzd1UpG4jf2/Qvu/pkdonkvmcZU0SRIquep0P2+3j2s/AS23/srDFL8BgKRY
	 tfLCgyOAqOUroL0/LDcYZNH+/lhm8hiDyuCgB5G5lk8tTIHCc13F5iJ9bXWidFRHH+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a1l09Ix2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Er0SBlZ5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC5C606A326
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABC5C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a1l09Ix2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Er0SBlZ5
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdwes2105590
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+mVvp7TjbMKQWDHg7IqBJlBTx3ZQ6XoSxRPaCYFhPkw=; b=a1l09Ix2BCcHKKKZ
	fGLBdzeI4THVJWj8zMXDns9+h457BVMzP063mYKfUi2e4qQdrdTNmSn1r5sTI7Ls
	Tw5Ja+63kly6j/NeA23Qg8wsZeLUjpT7m+LkNYWz6cZklBO6T/wOGjMtQNAybUmH
	3VwafKKTZ7CbGhcY/1eZhv9QQZh1rIefZyAGZyXuR3SfX7ml6j2KeMM/SFSS+d32
	8q5AtVgI021rI9d2pC9gW6mZlzmH+Vfan1kqRYN2IRTMfQoi3wCvvmtBG1C118fd
	npVRNI+WseHZgqa5jP5+j+P2BMWMDpPzxtCDjp4JxK6TvTopn10GUTxrTPByalPq
	Phqftw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12pur12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:27:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1e62510cso226748285a.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793194043; x=1793798843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+mVvp7TjbMKQWDHg7IqBJlBTx3ZQ6XoSxRPaCYFhPkw=;
        b=Er0SBlZ59z6qbciRcWPXsOMYAey8/finMAPhax7kY4vnYn4aPuRhj5ffQjw16FJvO+
         5d99QwAalDGCIm9gLCu9G74JBf+ub0LPEe/15XfjZjD3EOVw7e0xwDGwsIXr/ygsUQPZ
         XwQPtvdZmgcFN0agIp4l061nYee8KMRTTPpYDArgezJwOo8Iskl93IHJ+7GsBZolsDqx
         hm0IXz+BKZBeFpg7UZCUMUtRVZEvLA3iLNbZ0foHtYjkaFfbf2hr8xjpiGVkkGYxwO6t
         M4Ye7bajeHhVREbukdnGsHnW9jpEVa/r8i4pXSGkfRvuS8mVYjSJIcI4xmH04TtyfRPD
         t3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194043; x=1793798843;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+mVvp7TjbMKQWDHg7IqBJlBTx3ZQ6XoSxRPaCYFhPkw=;
        b=QWiaT7y1XF+boAzapK18E9GWCWMpoVQrVIFsdBsbniQGy1U95gR2eAsntYWBmwRYsD
         54zXcq8i1aV7Xly7wZ04wqmW70RS0Qh5p0vL+XO4Gpkk6KZOKwlNODn1VClg3XICnUDs
         tvN+zhI/7rVmlbiKOL/96VTJYoe0214lw79euukzSlEJatKLv95lniGZu8JZrWUpW92O
         w9KP2rU9TSWOA+/QZHtD2lc1VD2dQyyQ/vtyZptmSltkVGwH/1RKSNgyWTbjZYRdwBAD
         NCTiZ/wvV/3faQanKqko0QJOoU5ZmUvKhhxKzKEqMDMFekpd+JuRe7pcODsNZP92pnqc
         BtNg==
X-Forwarded-Encrypted: i=1; AKwUvBwvJT9uOyajHwWtknQZLBX0X9sqcnSo4P5Nh3mPpwKIrz1EZAwThB4nfd6vvx6i895zfaT7UUcLSEuP@vger.kernel.org
X-Gm-Message-State: AFq9FYJU4MI6csoTpttkjX5bYD/y3PmPzMdWIrqX5DfEy/lEh1kRc2w+
	+v8dHMaj3oVpo9x6Gb1ZpE3XTBwbymLce+d/is+jCcnZYxadrPiLUf893fMUQPC5osmapVMA90k
	Nlqj/hDUWwtcO3jtwbHG88N1QSlTJ67aHjaM9PwSr9k+bWmzYBJpq0WF0dkW2+zhA
X-Gm-Gg: AYBFou06fmgk51pZerOCi+xnyziYHQApUYzyqI9L70WZ5k0u68UucaQeQA/OU5RGAEx
	zvW7DmR56D+N8OCAWERk22qaLTRw5eEjblk1I+7hEXssUEtYyE0zAlB7a0P3ekFlhewLROkDaFS
	ExqrdHZDmiZ5UuSmXIGrU+OdBaR+EzsegUZB4eN3Y1HHE2VhrAc9mj2xY4R+2KZGtHos+UviqpE
	8lprce92oaXYnZAEqUjI+792bb9zokBUBpxO8YT6CTFVjOgABhZj+Wd7EwcxPWOUeFItOesbObp
	PjHRJdD5xM828K4SZoVIhKTJEOOw1kEFCAIW8iQ+ZoiLl3VWsbHTjR1S79AupIwUMCgx/ccZwCd
	v4lnWFWCIYvkkxIvZU0CSvb8hOhZY2gGlhGZB84dqmNZ13Xeh5j4fU28Txn636GpO4utO/i/QzN
	UUfWMwWw==
X-Received: by 2002:a05:620a:6ccd:b0:93f:3219:835f with SMTP id af79cd13be357-94408d6566fmr316578185a.81.1793194042821;
        Wed, 28 Oct 2026 06:27:22 -0700 (PDT)
X-Received: by 2002:a05:620a:6ccd:b0:93f:3219:835f with SMTP id af79cd13be357-94408d6566fmr316573185a.81.1793194042330;
        Wed, 28 Oct 2026 06:27:22 -0700 (PDT)
Received: from t14s-gen7.fritz.box ([2a0d:3344:53ef:7b00:6223:3974:4196:280e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94fce50a8sm37133035e9.4.2026.10.28.06.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:27:21 -0700 (PDT)
From: =?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>
To: Luke Macken <luke@phorex.org>
Cc: =?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Add Elan touchpad at 0x15
Date: Wed, 28 Oct 2026 14:27:05 +0100
Message-ID: <20261028132710.10051-1-lukas.maerdian@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014234949.1730808-1-luke@phorex.org>
References: <20261014234949.1730808-1-luke@phorex.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _SO1-PcAG67KRUINnljg2IcKwEdWQIbA
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae1f83b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=meHnPOM5Jtsmck6FLoIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfXwaJn0bHpluS8
 3/u2b2AqYhkeagBARl6gKDTlhFcghIG6Dwlt9wY2/Z+OlimppKdvmaa+83fs0oO+eTgzhoU9+uP
 WfiZA43x34oIhg9UXnhNryri3DcQ6vd+4gLGjNKn7vi/bi38mKaQqKNEFlOQSODniIvsJO64pnP
 KhB6GruKcgNpUuYGauQZJJaaS859zLTa5MYZSQLMf3HemIX3seGPghN434H5rx4fSGcVXnJSshK
 2APCJyO9HfT6JW4BQqCdJSWPfPZUNL+xMURluNuB0o6meBHSTwLEEgC1T4St8ryKHn0jr/7ueew
 GtdxyoFD88X6uhwEYtGBkw4ETH0DIzYeNwhu3IpRs/eopmijRMur0rosLkYgLa97S5VIjvLIh5w
 BvKXe6t0REXZFDg1BkH0TK0OJgs2hMw3nvW1a+beav5uGi6pTjFk2eMcXxUWU714ldWt1zo9cfF
 cMffJwipaRvBUyVVLpw==
X-Proofpoint-GUID: _SO1-PcAG67KRUINnljg2IcKwEdWQIbA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX1pGln930bpLe
 jhLHo59HtbFpgds6+IOgcOEGEJ1L1Z/LvluZ7c/lS5r/FoP4JTDas5HBz7Yyiu1DBUcxiAYeYnm
 Cmj6igooXE6hIXs/N92upTGviTkONrM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280053

On 2026-10-14 23:49 UTC, Luke Macken wrote:
> Like the T14s Gen 6, the Gen 7 ships with either a Synaptics touchpad at
> I2C address 0x2c or an Elan one at 0x15.

Tested on a ThinkPad T14s Gen 7 (22A8S0070B, BIOS N4PET33W 1.14) with
the Elan touchpad (04F3:3327): it binds to hid-multitouch, touchpad@2c
fails probe silently, and no pinctrl conflict is reported for GPIO 3.

Tested-by: Lukas Märdian <lukas.maerdian@oss.qualcomm.com>
