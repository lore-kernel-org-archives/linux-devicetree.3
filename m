Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602D2335BBB
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784907347; cv=pass; b=FjUlYupjenzq4w6nt2bKvnywDE7JZFdydXHuwVoefr9YmOyOYAt9083bmVVWhOofbtsVaDMdqwj311i611/luXDbop1ACVutkTaOCkJGe7JNxcGasEy/Ox71iwpIBS13Mcyx3aZbw1F334Q00alCMC9NG7tr3ZW9CzR7cSERqfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784907347; c=relaxed/simple;
	bh=0AxRvCjS4SeGauYtGrq3Gxj0CFvSuzE9MU+SB8VxZqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RWSPFlIUZ5DKkFsvjEmeUr78E7PiAWuxb328gZe11qtYg/8KSeo8uE1cDopbkhFHL8rXN4NZu0JUVsjE3Imv6Z/pQTpAwMgNF7jDBqBGXGGEGqUmCPzxYJ9XMcoNPBcJoUnaVmXndHHi0mJvT5No8slvCql1wIzN/8IHVEBlK9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0UZBLpm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SVitZbLB; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0UZBLpm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SVitZbLB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODb5ha2933423
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0AxRvCjS4SeGauYtGrq3Gxj0CFvSuzE9MU+SB8VxZqM=; b=U0UZBLpmLfPDvk4s
	5VVXy1GRsf9VjasKo9AZa15zarTyGa1QjJqnsNNIcbBeIhq1YHNQb+NLdvyNnDBN
	7R2Qp6iSbQ65AuK6J6JrFFQ1KCQdPr2+h/xLiVb0Y/MG478NDq04DnEdkLa8RE0C
	q+9xAuEvlxgPwplct6yAF7BlP/BSC51W0qX4xC1wqPCC2kNiVj4k938GrWe9if+u
	71b3BDT2ouTx0lPbmDcd2jAvWSKlChEuLO3YlNrfAItJPh+7d33op3mu57wYkF5k
	m5xvoz86F6mTz6U79nCSLiaxF3eZb68e4/ZCxZPnHU/bjNLEQ39PFmoJr1mgXWyD
	Gn0Tzg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cj8kts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:35:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-526da7e3c9dso8849931cf.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784907344; cv=none;
        d=google.com; s=arc-20260327;
        b=pVrf35Q1uKu8ObKtjGdiTekFoGrVrg3me2w7+no2g2hmrJMkOj+R/zvPPSu35sbYGf
         3WugVL1iRZao/47dYAI/tY0UQmGqFE1VaxVw+s6Y7YySTMG6Y/Qz56XMg6ZEsAOPg+XI
         Cyk0ODFg8aTbXfjCQ9ryvF+6Ss2sr+6aUD7/brzdhr/6VmBHRidbvCAl5OR7S04dApCA
         JpGPe9pyPu2YR+RD6iYrPeCItMTqnr9paXjID+toXr5i6YP4MeYB3tiPUaLkJoRNblc6
         jAmjWmCi0SzScGdY5I8EXGOl46r3bCdz1V2yKfDn3g+XVmny8obLFloVPEJzfGbQWglG
         XW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0AxRvCjS4SeGauYtGrq3Gxj0CFvSuzE9MU+SB8VxZqM=;
        fh=aZKWSSWWswG5pXmt4Ta2kpRV4hGMqt6V/jdd15AyqqY=;
        b=WOzX0Dk6hNtFuuQcJfa0cK/dNvUEwqIExZ/aHezZ25AyuE9hSpyml3/ehuP5/Ui5/M
         awfL67at4FEg0Qu0ea6wr6mIvs1IPI83G7tc4AfPmvmBOT4CpxqTdRCxXh4YoJydvgZQ
         xnNKH1e6WAgIXAUFX66IERn/xfjrNwXrJFqBhLFd1zeZx5YVqSxsNJB4M1i6LofYy2dY
         M8TSj8CgIDuQDKvIwXFR8RRifiaVQ2f2nKAky6XjKKj+K3mZfjqZ1Q1mCSyQEhxnc1Sx
         0y/F9JYhYPBMKbm/ci7EMXvtMw8n+w/BuW7ysBUkozAzR/SfMbwiKnGssrpU1BqchBlK
         dNwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784907344; x=1785512144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0AxRvCjS4SeGauYtGrq3Gxj0CFvSuzE9MU+SB8VxZqM=;
        b=SVitZbLBEQeqhXDYttKqcffl1bS8srPij46robugKSWL9bw3tuZrUUnPKAYt5pApKd
         tCBNmFfDUHtXQJAl73/hW25Eyn+edSA6L2iRFurPwLFpHJOpMd2oDiUtU1bfM8eyesCX
         GuOQOamdO7slnkWhiK5z2X2slT4JH7LANGzFtPnonmH2oQCU0tBOkw2W9pmfXYjMJDR3
         A4CSzAWZ2mfMacNxnuGzXYmaydr2aDKe2avf9dm+T6HvPdDZ95Wph9wfSJOiP0ZEAjvD
         vpeyuD9ls10BdyB63miOd4BGoIyQbGSe6it3/AVvHhHoFFdTyL7FhzRYem1esx6oS/jN
         vscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784907344; x=1785512144;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0AxRvCjS4SeGauYtGrq3Gxj0CFvSuzE9MU+SB8VxZqM=;
        b=QtMk6z/xvSdHvZRgjw5yv4ZUe4Ad37uToDWZ8RKPKMnAdzCyyhTXVMLVVZlKfbQB0H
         qKDsLQBte2xZxs57bIQZGlo74JEm0Q68y7ccMiWfmyyZeuBVOC2NbdaJPyJTzrpCpzNl
         4WCKC5yW5zYFHRjKzjIpQkyyWrVkklh2QOl9+DmuoAKZP1i+F4oH7umIO5mJ0HGyRGVp
         8n3zzsshylWPQV0fKdsOtqXH+XZq8PDi3H+FPtrnxumLfK2zO8nFDDrXO3PbMX9O+pel
         xWYdUhZnuODB1CcioMv9y3oCi55E2nZ9hTo4cAS2ZSskGIR2gPlrk/zSFYOk8E7VpSbZ
         WsIg==
X-Forwarded-Encrypted: i=1; AHgh+RqWJaaQgunVfhJSBFquIvKbmNKNL+lwSLRK2D0UTtkBLZn7IoS3lADGVjWSp1YEPCQIg6coPD2F0ewe@vger.kernel.org
X-Gm-Message-State: AOJu0YyNQ0VYuSq/bhpSRq0/Bd4+N5RBgVi8jj9Cf9L5z1rj/i3HTi1R
	XQ1YP7vuc3K5Damd1pbobTx0iPBhUnvgeDZnTl+J10uk1M/EXDCeCCEOdwtb2rUJIWKIU6jtB+w
	V6/uYcm5mxLLsBWP5xU5+eCTHcOmInYoOxArMzm/n1QvnS3A1zm7pSKMGuVwYP/MDExXJTPyfo/
	Xn2oPKC76zrBrKSB8Bx5xfClp+A2nzU0CowbryBkE=
X-Gm-Gg: AR+sD12LVKXri/TNDl08F+eCELghsAIqbjTm08d1+cSmrs9286STVtwvOgSFEVCduDG
	BQLhO5bdj3JBF5gp6am6wB+9ToaaUvuJgZEjqyBlnIQ5wN5sDFJrzEKef3akIUrJWwaFzheEDZI
	wWLFXVNHbq3CwbMUEPlwXCV5XzhFOUbfdl6AsakgdUJt0B3ySOie4NOjGMIA==
X-Received: by 2002:a05:622a:228a:b0:51c:1241:3b09 with SMTP id d75a77b69052e-5283de54e1fmr76891481cf.39.1784907343585;
        Fri, 24 Jul 2026 08:35:43 -0700 (PDT)
X-Received: by 2002:a05:622a:228a:b0:51c:1241:3b09 with SMTP id
 d75a77b69052e-5283de54e1fmr76890551cf.39.1784907342860; Fri, 24 Jul 2026
 08:35:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com> <3d954cdd-6dde-4be6-84c9-2f2f7d008f5b@kernel.org>
In-Reply-To: <3d954cdd-6dde-4be6-84c9-2f2f7d008f5b@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:35:31 +0200
X-Gm-Features: AUfX_mwd1WNIZvdvXqoWeMIN9Hp4kEAy8VC-hn59NszviBxEKOIP4_juVgFnXVE
Message-ID: <CAPx+jO8-9YSJtXNfnTrUX_JiCyddXHn=wHek9=c99+fNp22Zog@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] Support for block device NVMEM providers
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
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
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=GJE41ONK c=1 sm=1 tr=0 ts=6a638650 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8
 a=XoVDlNqzt-XzKL8N3f0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzOSBTYWx0ZWRfXy2+yX82JJvfT
 D3BiCJiJQn41K3JOH/4/NhTZu9mfaHaLURVowSA9eWjzB8+ist3oFGdznmU5wNMRu6/VzELRsRJ
 Yxl8BVWIhY51Dsgo3G4DR+atk4piHufBAc001/YjvUEQ1/3dyod7iyyIUOVXPJDzGfQQCYw9O+Q
 ZktqZTkbF09zXFO/VrCYBphpdEgWXQojA69yjm4eViqHY//I2NthxlLSxZIxH89cCn7PCDIttiZ
 auNA/i9gUstnPnIIUqgwwrTsB8NWKWVt141uomwUhGYSfoY0YPYIpOLw4UpRwIs3thNvmv2eJLM
 q63jyBKsoqZeft9R9GX6uKyG3NJo3jSHZzzRzuXzz06D5tiHT6kl0o5Wx8OppwbyqkjjB6htovi
 X59RlXVmiQxgYyGYfHphCyTwOdyI+jWcUf7hERbtzRTVFA/rzBh1FOB3ayUYM1uBXUYnTA1V3Wo
 liq+hWi/F8ayqA9ii2A==
X-Proofpoint-ORIG-GUID: bNMvXEionm0K1zdMJAcAUiuLtBH5B3_I
X-Proofpoint-GUID: bNMvXEionm0K1zdMJAcAUiuLtBH5B3_I
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzOSBTYWx0ZWRfXx1JKRiBs0yvM
 0UkLnY/BZeRnZdOvDLELti7TIY9OWtjSuGGsAR1qtECSAhZx4l5RfKs2HUMNz8iCCzrBlA+sOjj
 +HPM6kxByPRVBQ78H1GhX92Bo1QqySw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240139

On Wed, Jul 22, 2026 at 3:56=E2=80=AFPM Srinivas Kandagatla <srini@kernel.o=
rg> wrote:
>
>
>
> On 7/3/26 2:45 PM, Loic Poulain wrote:
> > On embedded devices, it is common for factory provisioning to store
> > device-specific information, such as Ethernet or WiFi MAC addresses,
> > in a dedicated area of an eMMC partition. This avoids the need for
> > and additional EEPROM/OTP and leverages the persistence of eMMC.
> >
> > One example is the Arduino UNO-Q, where the WiFi MAC address and the
> > Bluetooth Device address are stored in the eMMC Boot1 partition.
> >
> > Until now, accessing this information required a custom bootloader
> > to read the data and inject it into the Device Tree before handing
> > control over to the kernel. This approach is fragile and leads to
> > device-specific workarounds.
> >
> > Rather than adding a new NVMEM provider specifically to the eMMC
> > subsystem, the new support operates at the block layer, allowing any
> > block device to behave like other non-volatile memories such as EEPROM
> > or OTP.
> >
> > This series builds on earlier work by Daniel Golle that enables block
> > devices to act as NVMEM providers:
> > https://lore.kernel.org/all/6061aa4201030b9bb2f8d03ef32a564fdb786ed1.17=
09667858.git.daniel@makrotopia.org/
> >
> > It also introduces an NVMEM layout description for the Arduino UNO-Q,
> > allowing device-specific data stored in the eMMC Boot1 partition to
> > be accessed in a standard way.
> >
> > WiFi and Ethernet already support retrieving MAC addresses from NVMEM.
> > Bluetooth requires similar support, which is also addressed.
> >
> > Note that this is currently limited to MMC-backed block devices, as
> > only the MMC core associates a firmware node with the block device
> > (add_disk_fwnode). This can be easily extended in the future to
> > support additional block drivers.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>
> What is the merge strategy here, Am happy to take it via nvmem tree if
> all the non nvmem patches are acked or reviewed-by.

I am planning to pick up patch1 (dt), but waiting until all the
complete series is ready to go.

[...]

Kind regards
Uffe
