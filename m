Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05573FF1AC
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784598717; cv=none; b=nGMZz8tsp/cQi75TnTc7GgHAdgK3dle6vJ+ncyfMzZftzdWGt/Phs0UYsRHGjzpUcjel3fMd5VCvaXzz+jkMYIH4qvJ75MB6m6lepWd653LuSH4t6RMkjiPQ5bjYHc++HNGTmIbeUoXj2g0pASblwN8QZY0vRbfv5GHtqUXWK5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784598717; c=relaxed/simple;
	bh=UD2pWwm7Le2tlxHA9aRPkuTZmiMjQt8StTkl3lqpaeA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PE8rap2SsW88JJl2u6ZwA7r4PZbLEiW6UuZA9KmQl/U1v0pX6mJfq28RePFJ+RC8TUINxt7GzbTKXVWRMN6zlrfgdH2lvXZS0NRK0GBYAzCou3s5Qe/0WaNZcT+mQhBSIV4iU4xakHOLdAUi5zbZQYR9xHexwKZ0LslU8j22qmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aCYyKhTP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K/KvzMCO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aCYyKhTP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K/KvzMCO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCYA94107138
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B17MRcp2k+DsouMX/N51t0TmocqJVKGYjSpvwQiRJVI=; b=aCYyKhTP1slIbela
	patlwK2yAT1VHKjJSRebMgULkSbrHbNSr1t3XKF3lmmak7V9cGkjEZBcR1Afothe
	funCrHZexOsTJcHUqgtzmUgFkXmkzT7QhK7YE7k4Jbby3L7+K575ZrQPWDvoVMYN
	Gf5VKTTwZEbBLtMpgj5CfY4W9J27MMb3kaFMr6qpCvP0lOHZMWCEV1ts+G+SoK2W
	slfhRtqJP2SC20ugl1Kb/toUHTrFrbjIRH7H4tyianDpcr+GNfFqef70Z15BeR+S
	mBrfTK+4zMa1KHIKPkHu3DolGnKguXjI7pEDSmUvjj4rHF8461RAx4Jp/NhXYe60
	DjFYkQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqn8g4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:51:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf2308ef97so11787135ad.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 18:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784598715; x=1785203515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B17MRcp2k+DsouMX/N51t0TmocqJVKGYjSpvwQiRJVI=;
        b=K/KvzMCOFzXxUw47Fx6h2duXJXqkeY+uNW+hd1BMrnWIeKjh5vU9uSHhQLBu2i2kbS
         LnDdyKeZ4wGCCCiFJw1wkoNo8ALj7HesaEub4bGGu+4004exrqBfE6dlx4Lg9QrML/vf
         VJGQXOL5riHfYsoXJH2OGM26jN27bFvPxwa5kCgUTDw+mpFHvkb4I0muU+cbfzjJ2jYG
         oZxOkc3QsVscTf5kJ4eVXy5QM0GbWbMQ9JMAnn6EXT3OqduugsGDvOqwoe6HYRgjF8KL
         IXIITnJv3Q01p96nuBnckj9Vdeji/rGnN1/lMijC/Qw6ldcjd0IdouIcJkpTMra3d0Dn
         3nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784598715; x=1785203515;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B17MRcp2k+DsouMX/N51t0TmocqJVKGYjSpvwQiRJVI=;
        b=Lk7ueLZTbEIzzqRqRw/NcUi5f/LMuAQRrBexSqiLylpfjS+IlzH25woIoIa3Qg5xoq
         ywYCS9vZoDcS5Kpj6oQ6J3BX0uTWVoWJ773HfMeNMYNI4C1nMUs8H9CxbkuWhc5TGm2o
         zW8TLf97aOdktH6yXKohC5FyLgnQBI5b4Oe+yI6VqGGoaPqhxQst7kNZsuRQ+56x6px0
         9r3aSeipEtck0gjiTNuPvlyHkNrfJPf00bPEvTSRikKPorTO3VXTx5glzz4b/+F08QEA
         S2vXl39c1aiCIiU2Q1sDPp4D6M6ioUIVnAomlr6yTgx47dvy1g/Jk9mkw35p6E/0OVwA
         XkfQ==
X-Forwarded-Encrypted: i=1; AHgh+RoNSkPfSmJxdkQLeSbiTxFO68hTEen/Pq380Ob9rszzuvFbyzD8Qh+o2DSlHzyAnDCgQgGfgYJ9aqQ+@vger.kernel.org
X-Gm-Message-State: AOJu0YyBiPzQ1NXgvQdCWry+cKn+OWd7fZn89rzUrzckcYV7p0CB1KNE
	KN0zqrNmwNOmaC/6HfbmJvfC++ymVsx69dmX7ySHzx7Bh8Aiexm5xbCzU+vgc4s6ohySnSiu7dP
	hi7EdDGGzl1LRa37O+pMBgcfDdvGuw4YCr+WG9jmQYDZnXXc9vSvS0Ara/kuCrN4WCNSVJ/Vi
X-Gm-Gg: AR+sD13pvtRrs+fyeSWuUdjRw8YVXD/dVSNF55t0mocYMZh0qIKo8Va+5MB4TiIg0qg
	B9vFMus1NzaVQ4nIv6WwuQc1STmA0tVbihgviUuXorffrqfXj3wJ3fdU6ha6HdLe+4tEn9SoZQm
	czKckjQPYYEHIsmkY6AUpN7gjmkq3chNc6Mg2UoB7P8jDKHkdv2Z4OPj1t/aZE91LO65aCx8+DI
	tysDWb5iX5z5VDvkjix6K+4EWY2gQ5mUJSaP70lLCgvj+SxmKvNQtuGkOSsXqlBIq9bQRYHiqjR
	2bSBr2bVIqUCfJYay1nrXHfDDRaS+nQIwWO9ZLGsD9DMhyvUHnxQYk92h2ANUyeYLwA/0rbSGPL
	Rbh8GLK5aaRjcNBmn6Mw9QDyXmFyN1BWwvn/F/+t3FI9IXvWqJbQ=
X-Received: by 2002:a17:903:b88:b0:2cc:e3b6:f305 with SMTP id d9443c01a7336-2cf349ba609mr133376325ad.4.1784598714997;
        Mon, 20 Jul 2026 18:51:54 -0700 (PDT)
X-Received: by 2002:a17:903:b88:b0:2cc:e3b6:f305 with SMTP id d9443c01a7336-2cf349ba609mr133376215ad.4.1784598714602;
        Mon, 20 Jul 2026 18:51:54 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a02b7f2sm40346757eec.13.2026.07.20.18.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 18:51:54 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 2/3] power: sequencing: pcie-m2: Match WCN6855 and WCN7851 UART BT variants by subdevice ID
Date: Tue, 21 Jul 2026 07:21:50 +0530
Message-Id: <20260721015150.60198-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAMRc=MeowD++93_eaYSBp0mKoY0nRROLFncLP6Ec_TdJn3jJEg@mail.gmail.com>
References: <CAMRc=MeowD++93_eaYSBp0mKoY0nRROLFncLP6Ec_TdJn3jJEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAxNiBTYWx0ZWRfX5nYqlxtx9uwp
 LJwxXTFYWp2Pm6LDnxr4czuhrfwgZs+W2pE62M/TLysqqoeE2lLZkfAup3jTSZueLr2yWlkQR1a
 IUJYUIAj2VuUFqRxAqVoBRok+sn4tf16IsNk9psrBh/bg8DCPGa+J7jtNst1e2lM/eoZ6uDOmAF
 bq1Z7gH0lwB4YOHnTUhsgNSJ1G6NQweI2FDYweBLmDzxaNP39bKIiL0QzmuA75aPJiuXI8xi0GP
 GhP4VudKTE4HE6IX1f4v/NmlwyYTfzDT+2gJ+EcZNaJPCVOU+PQgv/EQUhplj3TuZkmnfU31z1k
 6vXzDt8EEAHRxSFthGOV4ExQ7+vsjYyn/j2Uham5yBZMk/lEASjOkHjpoBM/GwiUamoSwyQS1oT
 UXQgAmlH27sWuHG7UYHsgaYoskW8Qg90yAi0trag8eTCvzekuxs9PZtcU4JWM8VHpEa62JDEdS1
 0DGTNnVWe3xgZ7zoQjg==
X-Proofpoint-ORIG-GUID: E6_H5zHPj9Mj6tdEkJNsr-HXZ7LznDNP
X-Proofpoint-GUID: E6_H5zHPj9Mj6tdEkJNsr-HXZ7LznDNP
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5ed0bb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=6OLaB2FWHzg5-YzQX7YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAxNiBTYWx0ZWRfX68UBPc6gzRi6
 PAIfO+FAAPe4iqC50xBN159zXaO1GXOWN/3bB4oWSC2qZHzI6h4xnagXcsInZeGimzYmk2bIPWu
 igQ1cWJkF8rKXadOV/BD5y6WOYM31hU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210016

Hi Bart,

On Thu, 16 Jul 2026 06:56:36 -0700, Bartosz Golaszewski wrote:
> On Thu, 9 Jul 2026 09:29:41 +0200, Wei Deng <wei.deng@oss.qualcomm.com> said:
> > The WCN6855 and WCN7851 combo chips are available in M.2 card variants
> > that differ by their BT interface: some expose BT over UART while others
> > expose BT over USB. Both variants use the same PCIe device ID for the
> > WiFi interface, distinguished only by their sub-system device ID.
> >
> > Narrow the matches to UART variants only by using PCI_DEVICE_SUB with
> > their respective sub-system IDs. USB variants no longer match the table
> > and will be handled separately to deassert W_DISABLE2# for USB BT
> > enumeration.
> >
> > Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
>
> Do you want me to queue this independently from patch 3/3?

Yes, this can be queued independently. I'll send a new patch with an
updated commit message — the previous one mentioned "handled separately
to deassert W_DISABLE2# for USB BT enumeration" which was tied to
Patch 3/3. Since we are dropping Patch 3 in favor of Chen-Yu Tsai's
USB hub power sequencing series [1], the commit message should just say
that USB variants no longer trigger UART serdev creation.

[1] https://lore.kernel.org/all/20260715085348.3457359-1-wenst@chromium.org/

-- 
Best Regards,
Wei Deng
