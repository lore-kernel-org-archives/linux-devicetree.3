Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6803B313E2C
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 13:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343550; cv=pass; b=ur8H1degrW0umNMiazA1ID04XqaF0mgNPf/swFb7wmfOD+rCjcoHIbv5WthxiG5k/RyL8YYj0bkuPEoQuYdAYLbmRz+UsQNp2t14zK4q5BOrkZgtXFlIjwS/M1Azb5awWHbE84L4TuMI5ynICItEL55ESzPUtTdyeq+qghDyV7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343550; c=relaxed/simple;
	bh=kqdNlwg778/987rRPFcemtjB5R0/alDQShoyszIUXi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=phpqgK41DesahSMExYzl2zGFVT1OerWlPvy0oxa/0ivKeR8fqg2sE62J968elZFRERr/U5FZUSLo59PnWKWKcLd3PRFHVN+dwTkw60YcsFX/n8ZDn1cl6om3McfGo8JvnZYp1NqLLw+OFUTDSpW+xG3G6stXhvEyC/oTXi9NIOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CiFirrNM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OjLnN41T; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CiFirrNM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OjLnN41T"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PA4S5b609540
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 13:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDqgsZ4XGZtl4jjOzkJ5PS9aFgMs5r1UIrTA9EsegCY=; b=CiFirrNMJE46vkez
	ab/ALVoKzVYq3KdM+wurlRbp1B6pozl0+xZlajKqHYhciUozzuBY7HlW4B9bEgeq
	01aTayxTFbLZjXcK2kUyA4C5CGDxayVgrjT12DPiulgqZp8+24MXVbQFUBKalGN5
	p9GwIgBIhMFeCrnL/r+4yFxTmyyyZcUvwHKtmgVueHEfPC1dTHXv2IcCvaA5pY9E
	bXsatblJpbCU9xw3/A1vAwABdtqMVYDxHNRpOtBokCQv+9P5D3KSurkRHYF8jsvl
	7RxWADkv+Ho9B8J+D3C4m7HNizpmI3Gz6NL7dRH63YIWrYea4jFZFF+zLX2j8bQ9
	XChfMQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwpvnrmre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 13:39:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530d206e2b4so19391801cf.2
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:39:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790343548; cv=none;
        d=google.com; s=arc-20260327;
        b=Sx8uSl2XcNyqyCCFPC+eQefen4/vcOYFh9+rGAL6l9utH+HGqScnaqxDyPYxNW9okV
         FvAPrWb8X663FxPmPQWeZ+MG32qZmI6Jn1R/KPng0mWrDL4RGdJP9/B6jQIFiyZS5AGR
         37NIbiWIcN8WFQjRg3ZFfBMcOgLipA6eUZwGRWtm6Qc2UaV5b17emBTTJSOXdr7X0UrM
         MhhCWayceE2RONwUduPP4FpRdxNtSMJJV9Tm0tsSYta8mHCLtQOUNNDiutv1VX8TAUvr
         aTJbPvjtLClYhUTHZNJK/hEpjFLwOXSytrsoVPDkG89QXFswyw8peCbVGp3Luj2q0a5f
         LJGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kDqgsZ4XGZtl4jjOzkJ5PS9aFgMs5r1UIrTA9EsegCY=;
        fh=1qeeHxTH6eVJ3IwfTxBCvRpGYeH0PgERpISFUhqTAKg=;
        b=NZkm1F0NRWfWq2xD84K248RvffAGxtMBLbhWOXs8y/Hcq335Hn3uWzv25LOkcMW13z
         4Ur/rNXkUako8RS3uKyIDm5QCB5EkTxoqez6hC1NtWf08e0JJwJ1+eE+kz1NTU6Bflvb
         ypvO0uEHkhmCNfMmirlgX0MjzYPby+cMKAAwMNJEjLvBImdnK/VXXb7gls/N2unE4sh+
         jus9rlDd0O4XNosv+G1AACcorXNXkTG2fGCmNcQ8HDkL4LcWpkciLkZ8RtI6J1/Avp+Z
         JOEncQ11aWOC9x29uHO4Xy6ZIfXYYd0KpGnBeJ7x/nC1VRjGx8tZ8m/VIyyYW3aCVx9h
         RtrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790343548; x=1790948348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kDqgsZ4XGZtl4jjOzkJ5PS9aFgMs5r1UIrTA9EsegCY=;
        b=OjLnN41TvHXUGa7MBrf9fj+CrpaWlDp6jgP20kUZ79RYwBnqHsD2K/ZHsBfxJr0C6X
         5bLg4kK6XWXCGlWpS4+g8GmhWc5sivFMkZ6UPcPR0PfTiZKGAXGfrZJAn1JrUrO9v3pL
         +o/3NTphHMc1pEr1w9tuiniwaSWa84DJXKLHsZJBOqqauXJKVeciIGSFjrUGEe+xevFE
         0tu5GV/o/wBP/LDnwxL4ckGIva0g4Fy9erhgynszry1UC2kIN6hUmqZne6dnMQMW7GsT
         RLoI9Iw1mSzZIhFcCnl5EDBJRUTgLvqYhyFIIEVyfYO8DPzOfGwQ8Vznq6kgHkRZsrq9
         XTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790343548; x=1790948348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kDqgsZ4XGZtl4jjOzkJ5PS9aFgMs5r1UIrTA9EsegCY=;
        b=J+yerFTBvI0ZpgV+5AXAv+jfWk41IZtMKvOlGM7pV4VcEwqYSLOu/Bxj0HyQ6ADcgd
         fb7BlL6c7GZWMo5HyMZObuA0/kJ2W1NUNevOoEApUjE3UdgMBJkDFEj9edYlKKkp3DJw
         wrwc0yLx2clkD0FNhnoR1NuHfax53tafqwhuOCOFWjfaoP0RD8LcPgH7dhDvyzqYvraC
         NJBj8ZYXYkpnnulDoYM2Q8J+rIuLagnlurfiUjLopWxh8e5FrrGA9cCtAWyUZw8e0acB
         uRqI0k9vbckqFLJKMN8WYEB10EjeNE4N+YJ4Y8lL7mRQuolepmKjgWrbYbs8w28gHFIe
         j6HA==
X-Forwarded-Encrypted: i=1; AKwUvBzPP1eJUGynYJmkvihygNcZnSWdqQSLYDhTmjIboukFQ7I2ONL9m0GKAdgLdFR1ZSsfLhtTLwtFfbsz@vger.kernel.org
X-Gm-Message-State: AFuF++kaHbELsoG8wQTpVucnxR+2No+jdSbZQmXCNZbS0rUKNWCQ0Uxl
	NS/v5M/dDblxgDzt5OjTTar8tmCGJlDHF/wnxcbxZixwThSvz9lfiy6VqoTQRKgwV3e2T6v3Utu
	ZW+t0YUxWxcyqVrdJ6t6AmOQapKpKO1SVBEZHw5As4cyz6gohrg5lSTR0eb4hiHy8htQl/7WOyK
	KR3whY3i/CtFibdFz1JSeJ2ewEqUl/r6486T3fVXk=
X-Gm-Gg: AYBFou0UqWq1iRjKcYOGTRXVp9Qs9VN6t80vktrDpMveiSIY0eVtEksptpPIzZ+VsyJ
	B/BCJWc0KSX3iQirWlTgoIxNcCXvogW4iHd+6Nd8bpbFPI0SyXxTfjwzNdd/fB6RpW4oOhK9Hnd
	wJ73jyFYzm+aUfDzist6YFpIbPqDpWtrm2LIU4Nm5mOQCOhm3JgZ2O+qsLNf3G5qa/i9NziJPTz
	gyf1fqznmo4xARyG21mQuuQeSMLF6iBVOJ25L/QZNErzdE57q7MWk4UcakDilrsfhJCC7B/Uwg=
X-Received: by 2002:a05:620a:4588:b0:93b:fbf0:8791 with SMTP id af79cd13be357-93c43bf1ff2mr431889385a.29.1790343547629;
        Fri, 25 Sep 2026 06:39:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4588:b0:93b:fbf0:8791 with SMTP id
 af79cd13be357-93c43bf1ff2mr431882585a.29.1790343547133; Fri, 25 Sep 2026
 06:39:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com> <178998281449.889291.7893229102394463283.b4-ty@kernel.org>
In-Reply-To: <178998281449.889291.7893229102394463283.b4-ty@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:38:56 +0200
X-Gm-Features: AclHuK99T0Ubawi22EyQadvbidnQEmVlySi-fMkWCvta4a9Udx0OX1G_I0L1lvQ
Message-ID: <CAFEp6-2P14MdYJGuH6ygRL4ZKtLnJEj=PVMx2p+b9L1RuiX1dg@mail.gmail.com>
Subject: Re: (subset) [PATCH v10 00/10] Support for block device NVMEM providers
To: Jens Axboe <axboe@kernel.dk>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Christoph Hellwig <hch@lst.de>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: AW9fZ-P4s8M_x-X6JyIQl8_8fr3QbQ7H
X-Proofpoint-GUID: AW9fZ-P4s8M_x-X6JyIQl8_8fr3QbQ7H
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1NCBTYWx0ZWRfX0cFlq4cd0LA7
 LFckz6UlM9WzIotFtH2hSBqMxU5nCT7xiLSWj7SvyuEfVhUkU5PlQWyljeI4foZQ/E/JuTvBo+o
 jWCfEJ/jsJYL0blWw2mMwshy0d496yE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1NCBTYWx0ZWRfX1fI4U5ztzx/I
 y5hLfuXXdGmT7o6WW6f1tUcsVdPArhfhuiqPoIfPz8tX6bkpO9TWRNw81+rEQZryXRjgv9j6jau
 h14HhlD9+xESSc61KvSPAMCqF3MuP+y5t5SubFYqskNJyVCEF2YXAUVmKzKtUbIHMtxqO/g6hhP
 473U0YHhd3g6VBVMt0qBGWmxt2quxjmM08d5QlKXn3H4krozmK+sBmuoWK0uwTilIfRPqI61Bg+
 udRBdVmKgamQddyi7nzRs5ggq6G5Pu66s5ogD5CvRWT18FsnZVtsQFuUXq8PYWVRJIilKqEEvJO
 cJBRIClZYyfzyaR8MQVmsGDuaxg9ckZBY3nh/fyCsompiJxuyX0fNzaYhQZjQRAPZcfmPFh8DRt
 5hnFb1mk5mtGzldIlLBe0q86EiFYOBOjq6O161S1lpPHWFUQwEJo51l+N1BwMILjodlo/4Uzufd
 ppn3D58H5IL7bvS17bA==
X-Authority-Analysis: v=2.4 cv=eNmGH3p1 c=1 sm=1 tr=0 ts=6ab6797c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=MW6_J8xfeE2cRKj6bkYA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250054

Hi Jens, Luiz,

On Mon, Sep 21, 2026 at 11:27=E2=80=AFAM Srinivas Kandagatla <srini@kernel.=
org> wrote:
>
>
> On Thu, 06 Aug 2026 16:38:33 +0200, Loic Poulain wrote:
> > On embedded devices, it is common for factory provisioning to store
> > device-specific information, such as Ethernet or WiFi MAC addresses,
> > in a dedicated area of an eMMC partition. This avoids the need for
> > and additional EEPROM/OTP and leverages the persistence of eMMC.
> >
> > One example is the Arduino UNO-Q, where the WiFi MAC address and the
> > Bluetooth Device address are stored in the eMMC Boot1 partition.
> >
> > [...]
>
> Applied, thanks!
>
> [04/10] nvmem: layouts: Support fixed-layout as the nvmem device node its=
elf
>         commit: 9c6cab93dcd47c3075d896c777567b9d8f813d18

If you're happy with the current state, would you mind picking up the
block-related and Bluetooth-related patches in the respective trees?
They are independent.

Thanks,
Loic
