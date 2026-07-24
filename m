Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F0744780D
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 16:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784909970; cv=pass; b=TalKO2xNfTftB9kbEIfGLXIQnP40PR14qWKnpVJ+H63g75Iwb4frfuj1x+IpGy1R52KuDJ8xS18UoyWmIv9L5R8pFCof4MvJzYiBUzBoL5X7rUQ4U2uNqfa1p4J69qKWjSktbcn3FvA6yZPqXqaDuoUijAiWSSJ2wd860Ov2pI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784909970; c=relaxed/simple;
	bh=2Pz7yi8VnRHhiqlQrvwuFgDpKz5CVC4Q8lP2Pw68SCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I93ygVuOZbXJlKvi+pfvqxCBRDliGKWWQkwSnPRAtN0QXWzozzgHdBdTp3w2w2nbYC3sng/XlyOIA8gx/v2uI6TJkxiBGqHHdkdCEotiQpS9suwgktTn5BkXDhcaetQ8z/jY39W01SeB7APF0iR6CWqj8Mqk0P28hBU5Owx0FLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nbVcHouG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QBnWBs8p; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nbVcHouG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QBnWBs8p"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbNT23071688
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 16:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FuTrxtmptBklBXvMb0kKcU77gZb2KY5onwBT7j6J+nk=; b=nbVcHouGe6Z+VeOs
	h7qeGBArJI327t86C+PrctOZsyltv748m/ScDV0HsPpenC1z3jFTg4LyiV6J/FyZ
	owGOr/4SL9LTo2UqQvKh0uDL88gNcHr0uVKuOvntU6WpM2VT9F00DWYccU7reCNf
	3W+Shr4Az7Cj3bgZwWT10I5+AfeG1ieAsn6FNNauwF6wH+zK8KT/3uOxiM0PKJA5
	g5hCgpfIWj021uazh1SKvG5t/yYiUeiG3mZT3crN8cA/gFB3Nd8A8h8MQQObHNWx
	CXusUmB8HAJeYd6rra2az3epDYLosYNDbtF7F4WrLTpOgjM4yHXPbGflsMaEgVX3
	My6sdw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pwaks2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 16:19:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5fc4c7e9so62866085a.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:19:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784909956; cv=none;
        d=google.com; s=arc-20260327;
        b=SH1QTaQkMUTJkZu5q1HMNTnHwbNV0jSsXdXXjTlH4yXUv4ooY7KXww6JvJC/jSCCin
         dxtWqtbO7wHSaY/o1bQNYBIyPmxV4efomf6EGUsLuuusYx9xyHC+FRBjTyZp8K07e28W
         E6KssaW8MNHuQ2PP4ZFVc4ZFuN/E55bh+bWIzT6EmpALi1o+zBICYWt8Avb/T7d4s9yF
         whAmA28t2TQblaMUjkLvDqzjM9Gz/dO7eaujm5wUyWNTch9gcyEJZsHE7lzN+h97AkMo
         97oQ3BRBQWSA5E/2bLn/RmPYpbUS/ON+QqlFyU+xQE1DwxUPdMIOTvHqcBkfFMx2SN68
         VGeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FuTrxtmptBklBXvMb0kKcU77gZb2KY5onwBT7j6J+nk=;
        fh=eA+ny9czwcmA06wtDNB6h/p+VPm2jIrEk0n785wm8eQ=;
        b=AEGmI68f66R6P+XsIc1D4wYqDYF0Jn0mVBb2Old/MjkrZpKNVvW0ioa1S5Gm68/Z1Y
         hDM5Jl3YD+i+DdQA3Yr3I8WqytYL+QONVC3e6VwYnuSZzaYQHa8GtiQscdylhULWmfFa
         BAX8dCgO2OJSscunuaTLJIGPoMgJiAvR+W5AeY54E8vUcKjf5dN0wd9ixMZqqczytgj9
         yJvrTGFfFFRv9C225lZnUsBdltZbcmNg1EUh7FqsqsMsh8o4/vGrPM6SltQGE71lvvaT
         N8HzizwBYpa4miCzGASZTTBE6JLkp11A4ggGqBHPR7qsJikxP0K9H1WhdqSMIM6OteIp
         bmKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784909956; x=1785514756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FuTrxtmptBklBXvMb0kKcU77gZb2KY5onwBT7j6J+nk=;
        b=QBnWBs8pQw5wzNA8WwdaOkxUQQF7Ena/XK3A2pUYAMvQPPyb581gO2Mi/SAXt4VDxb
         pJNJe7B3v2OfgFRxwFEEBcaCxpmAOIGWUzmyQuttmynAImfQD73xIZdZl4l0P0rERPJP
         /lpeco0LGrc68SVmmkfXDi/Aiw6UgwokLKaftWKsyA4eseUOQuApP6mrpcFDoGn1Wdp2
         XzAotZjdfQ0eU3U+C+NtkPomPdCRd4j8kHoXIpQM7ncqY9xHNmrgaWVaQoVZS3puy+79
         pPlDzrHQ7WmKBGJy7BPyjCLZwlU5rtEpJaNSb/4DoSuZoS5RoR+vhvY0bbEDi+a4G8IK
         uohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784909956; x=1785514756;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FuTrxtmptBklBXvMb0kKcU77gZb2KY5onwBT7j6J+nk=;
        b=WY6wDGrKIwfaF/0CCjG6pp3uBPZI+50h0b6CLBMRmBeM6UC9n/YtfzRq84bzQ7RoI2
         F+ZPyuaSw8VEBGSMc4+gmpP+0OhR+6bJi/unuYMn2bGlygtbM2TP/j/h7GKLKGlharoO
         3zfhgb78KiESqlPmmP+FIcNeKKpHSSUAabb50zHuYEAXUw31dUDtXITSL4eMEg9nUNAw
         LBbby41+s3OqvTK+7H7jJ+0IH5Snz2S9PyqjR1VxD7JIlPIaUPlqcaBS2G4WdY3Ca2Oe
         6GeMGm9IOzqmAgqCeUmX/w9KH5ONR4kufjYMeS5y526xRHS7T9OgYR0wYmkbx9kc6XU7
         DHFQ==
X-Forwarded-Encrypted: i=1; AHgh+RoEP52V9QF3HdK3k6UMPUB2XaQPL3/AqVG4YpP/kiE5D+eOKEFn5zFc//t3BbpwS4BlBgEnmoD1OPM4@vger.kernel.org
X-Gm-Message-State: AOJu0YxkR0tKXOk7LuNEOHNQOubvmPI7bmubqfnCvFKa2cQPqtXJJlEo
	EJiMpxMUlyTRbwDFC9FgE40a85BHTFpRrAZFQg3QalephxZBCvaeIcIFsx+HsZrbQR6OA79uu9C
	eofl37ZEF4IUsntbYiZ7BkCXv8JaW7UgcaBI29BWjQHpW+9dU9d7KOmx9cR1irIq/NdiLEbVmso
	LVSfeZjT/z5xhYvuvXGeTi0sPMzHroyIWk0MOcHT4=
X-Gm-Gg: AR+sD11h3t3JMf5i/u9FrQ4no/9Ggu9zvO0FRVfVfsJg5SJrwGPRAwxE6uTFthUsNUu
	EKS4WEQNFacoLERBcTZ7/mdydRJVi1nRYLuKYrmxjoygXGiv/9WtOoN9mhPwomdYjDqNaryY85d
	kkWTGf+bI9ij9BuHR7Yw/sF5Vbw5myMzdramJ5mGK8Gd19O3+xq+R6wNsFNPulgC84wOq2XuAXI
	Mxg8lSIH3l+eGFJijBP9DYW7NvQM/cOyLrKNGF5PEdg1EfIQ+7MtK3WlQOnPAQRwIVmmawDcaE=
X-Received: by 2002:a05:620a:a29b:10b0:928:f440:2dc7 with SMTP id af79cd13be357-93103608240mr655011885a.35.1784909956474;
        Fri, 24 Jul 2026 09:19:16 -0700 (PDT)
X-Received: by 2002:a05:620a:a29b:10b0:928:f440:2dc7 with SMTP id
 af79cd13be357-93103608240mr655005485a.35.1784909955860; Fri, 24 Jul 2026
 09:19:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
 <20260703-block-as-nvmem-v8-5-98ae32bfc49a@oss.qualcomm.com>
 <amLwz6WuHYUwKKJo@infradead.org> <CAFEp6-1_iariDyqWj0KezHAtULSO+piPHX0F=Z46Rx4KDNLmXw@mail.gmail.com>
 <amNkX6HV7c_8jRUa@infradead.org>
In-Reply-To: <amNkX6HV7c_8jRUa@infradead.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 18:19:04 +0200
X-Gm-Features: AUfX_my698y_ctqeRF24VMWwW_1w27mTDvVkuG8C8ZhXfnEBEfynx8DYsYuY-cE
Message-ID: <CAFEp6-2sZTBba4isNDmykh1X0HCxoeWQb5_bJp7AGQHU1E+MLQ@mail.gmail.com>
Subject: Re: [PATCH v8 5/9] block: implement NVMEM provider
To: Christoph Hellwig <hch@infradead.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE0NiBTYWx0ZWRfX8VEIksEWWy2/
 k88mczPNn4/z8czI40iZj1RygXLqpjt63HFc5Qq74qsfnTx3aOZIqZEhz4LE3vxpjXNEXTTgNmg
 KHLkbgV0Ox/tI2w6teWncFTGkQkW4JD5TTL8BThCJBbRkwf0Pp0DrgbIQaUQfW22xjULbjdkY+P
 BqBqCCLOyZu7gJZd3cD0Cf6Zny02fVkBAVe3wCgfIVijdyxU9QP6YAtGxLHPFp4SccwdD08dgMq
 L8N7uCIrSv8aMy3btp3r4DiuRljqWkWaEfu37qKkKxbgQGHCmHZoWuHd99Y0LJeOzpFafAvzjkm
 H6TjAq6QuPkwCEbl5h84yYCj7pqRSEt+I75O9sKzFyjBZ9Ov4XKJHDCq9AooVTdRVBjeI9oZl+K
 KaM/FAvYgf6p5fTf/H2UN2Cl64kKebj+ae8m1MIJGIBSf4eziy8klTAOiPNBSrX3D+Ygnh0sKp3
 BtU9OND88Ns7fZDcnaw==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a639085 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=JfrnYn6hAAAA:8 a=-e8Xlw_gh5nxI56MKtwA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: -EW-051tQcrtpnjOV5TWJ3Ol-69bZ9dm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE0NiBTYWx0ZWRfX4yLzJJweis4/
 ANmmZUd6sQa6OZOjM6a6nwk8M3t1kqzCxjcXcyvcGJhZ4r7kNf/DKESdp+kcpijHWcMym1EiwzV
 KnoTetP4DrAAS582iADuiB67Q2F9M4g=
X-Proofpoint-GUID: -EW-051tQcrtpnjOV5TWJ3Ol-69bZ9dm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240146

On Fri, Jul 24, 2026 at 3:11=E2=80=AFPM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Fri, Jul 24, 2026 at 11:10:58AM +0200, Loic Poulain wrote:
> > Right, I was planning to add partition support in a follow-up series.
> > But since this is really supposed to be a block-agnostic feature,
> > whether it's a disk or a partition, I'll include partition in v8.
>
> Please include the partitions, as including them or not matters for
> the interfaces.  What is holding that support back now?  fwnode
> magic?

Yes, there is a bit of fwnode magic involved in partitions of/core,
but adding it is fairly straightforward.

>
> > > Also once you register the whole devices as nvmem provider, we really
> > > should keep it from being used a block device, shouldn't we?
> >
> >
> > I'm not sure, the whole concept is block backed NVMEM, so we still
> > need to add that block as base layer, though we could discuss
> > suppressing uevent for it. Preventing block usage would make the
> > feature much more intrusive than other NVMEM providers like MTD, where
> > the underlying device stays accessible. And we may genuinely still
> > want to write the disk (e.g. for factory provisioning), updating the
> > very data the cells point to, etc. There's also the layering aspect,
> > if a disk (e.g. mmcblk0) has logical partitions on top (mmcblk0pX), we
> > still register/expose the whole disk mmcblk0 as a block device
> > regardless. So if a disk contains NVMEM cells, I think it should still
> > be exposed as a block device as well.
>
> So we now get two unsynchronized ways to access the same device?
> At least we need to prevent exclusive openers on the block device
> side.  And document the side channel very well.

Yes, effectively, so the simpler is to open it exclusively per read
in reg_read with a holder (exclusive). This gives us proper exclusion
against other holders, but only transiently for the duration of the read.
It's the simpler solution if acceptable.

Another option would be to claim the device for the whole NVMEM
lifetime, but currently we can't bdev/open the block device from
nvmem_register(). That path runs early, while the disk/partition setup
already holds disk->open_mutex. So that would require a larger change.

Regards,
Loic
