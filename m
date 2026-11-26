Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795671358;
	b=maH4kHC5E3buxz+w/a3ixfYc8hDKHiRY51YZUaUnfWt8amCdD4AU8tjZFzlimsVBpYzx
	 fw6Q97elhVjc3awweRhWyEvpVHSnrUPy/nVTkiYhoXaKNrFcpNm1pd1iS6JeTyD4YAp8N
	 n5s6ntwhUvxhsmc95WEuzRkxTki1oPoCPlID2DO3URYzUxlTcO4DD1GQVCIq6Ybr2l1Hy
	 3uARKwJh3shJNAvRVG6t4+e44/v1CXQp3M3C2lmbmefmzLQA8fBJ9cT6QipqiXHdmXcwG
	 F0onNKhAwCpDC+k/sK1O3TgmKKCVHbzUhXE/jQyA2bTCoVk7A8UfEYhjEOIkIJzlYjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671358;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3wLY6WDXlt7DLeZFtzRLs+mGQyRljWZ2gx0ONlV7LhU=;
	b=UhIOmYksM5M//VJEVoxSJmO0VZ36IFEbjd508KTrOCJMzlkVj8CQ15LOE6hYMtoF62ky
	 HPs2/fVYLNZfmiYBKYXPB3sP7bFQWVBdLCqrK+sqE+wj2OQ/NYJ0RKJHOm5Wi3IfkHyLi
	 NseH+LOdG6y2JDTkvxRZZwe8JEZ8L+9pVx6GP608RYdibGe+sdNQ1N5/sQoevyzV1GIYy
	 ThszithtBdv9P/V6qNVqQkjEKw70Q3HNkBOVVDHghnCa22RhMQwPO+AIcCCNm8ZOC+aDG
	 zHdj/J6J+6sgRtrARGWzNVdn/f0YRD+1YCR61aZkA5CIJWGDLUbqrnhiFn+2TmDmJaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TWXpjIRZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GBazHJ1P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5C8606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B5C8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TWXpjIRZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GBazHJ1P
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36OYL3023384
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3wLY6WDXlt7DLeZFtzRLs+mGQyRljWZ2gx0ONlV7LhU=; b=TWXpjIRZUlAKYCrf
	bCoI6WcynwRJOZcCPruaTA7JoeVcKqIIpMR6MC32zewKuFm8RwaSvHcu01odul3E
	IT7E8doBt6rNO6Bnw3UhbNv7+RgmCLlzHMObpo0R038o6JRPLHK92WHvle9D48cE
	kj9aB9oJsT7kVKq004Q6D23aSu7rMyIkMg6w1lY91GB7vRYzW4uyoGonPK/UtesO
	xNL1vl04NsJEg4i6s3Kh94znEP0nDV043RsvY892raTNUoEi2PtEDW7zYHGtNNIl
	ew9rS/qaB3f/idlvQY9/DqZhV9LpqGHTfiFElwcCEYE5GTGQg5kfOyXwz3EwoHZ9
	9ExzRg==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vate0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:35:56 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67dae919cb1so9597868d50.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 21:35:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795671356; cv=none;
        d=google.com; s=arc-20260327;
        b=S+n2OxFPf6JpIgwLtzad35b7SpJcN/B1XGSTbBQjSIC91EZN+ddaPCfzwekACtP4x/
         lAhJSDO8+0d5x+7XF+aVfDVreIDpkmBUCDhXyM3Y2qzTBRo5W7f/7cMvX3QtEZxLFUmu
         LQpdsSJ8y9Kzw0zcDePWgt8whkm4Y/r3wCBI2p+t1A3nrt1Z1oNtAW/cn7gbxG6Z1GQ6
         he2iQgUuf8lleCn+DUkroA+h0unPA6XJB8omZRXGfPxznkm3fz0vHANXDAM8njJFXTVr
         NCs+noIeH3bSbRDDpUxP3GQBb2D6xHNqmHWapgCSnk3YSL39deL1YXB07XrKsCS+GN3A
         C5YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3wLY6WDXlt7DLeZFtzRLs+mGQyRljWZ2gx0ONlV7LhU=;
        fh=So1IyGUSwBN6HKwjAGJAXb1SoFL7ovT9FGaTHcGrKl8=;
        b=FArA9gV7OiO51uhei1uAgwKIdc937GX3ev++xAATmnHg2AyVWr1o7pd/F0FgU7Wm4f
         34MNfwKl+5KBvZzL+VQbcN9TE+uJlzDK4zMakVWgxE6EKsDWVVj0CJF3ExcseZPxicZ0
         +tNKJ7zE7Etj/XQu/NyIs+XtiQIx7WF+qPGPFmU2IdAyi4v0PpPMRsGZXsVxCAJFmguB
         oa36QlfxQlmbZZn1I8nAVgSgNQXF/jFLdDw55esKrD0tBuymi8kohXD8BHSDHK7+HUfG
         rYTFnx9Q8aSDZ/UJJbbba5R3HPND5bL4pYCF21RtR9oqY1wVaTEuT9EC269zSoUt8yuC
         r1VQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795671356; x=1796276156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3wLY6WDXlt7DLeZFtzRLs+mGQyRljWZ2gx0ONlV7LhU=;
        b=GBazHJ1PFsgPlv5sITz/jhplVi3hbq3xrYYH7i0/Deq9QQWd2b5xiZJeKasD9Sppfv
         K0OjgW3RqznELU+W6UzkeiO7NE+M2DLKzG5WUj0aXqXAjZlZsqmWdnOd54TWnGip6XrV
         EA315DsPP1Y3/l6UgoOndnx2NmK/Z3YdSryPwaTLT3MipAC/nQRAR4Xaj4OaSx9LzKwd
         HPvDPGkxkt1gV9Pw/PqBuV0IdaCa5GRlIWeC9uAvxFSGZOHx+J4BI0LxZD4qbrI5eSHT
         aHwCz8QpgzYDU9lTYLYQd1YoF/i/BarBHch0CiDxyOWjK75Aof8MVrS+yrnJnKmG3X58
         dO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671356; x=1796276156;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3wLY6WDXlt7DLeZFtzRLs+mGQyRljWZ2gx0ONlV7LhU=;
        b=P8mOWfnmq2pcJTwNk4xQ3rDOKWW+BDgnT7NT5YRh2ZELzxFk5gRnKGUfgohwX+Jgyl
         C0y/t5NKaeBlSS1V4JnBmRX8QuaVhf7d3sAKIi49PtQ4fxiSiM6DSbvmqqyi38daEEvW
         ZoNWfKCD17LchjHCrDU7uu3XfrluobQwtlaAWxasRCz8DwYT70/Qd8nPYH8hxLA8hIh0
         V170GpuT4aU8dDFeMVQtWAIxC7Ep3Nb7ygW8t94jR2KkGxRpdrfwo5bAhoILT/Lnxu+9
         j5YfnsasQ4YqGJim0LPQJuy36TDnSVy1KvvPoZYyrEnfNL5jzapWaAyTgHGLznOmrg12
         EjTA==
X-Forwarded-Encrypted: i=1; AL+hErHIsvslyZKbljhKVvEpnJHSg6Z5fFE1Itjn6AURvKkYcxxX9QPF2BTTcZjzXz2eGxGyHaoG3XgNGBbK@vger.kernel.org
X-Gm-Message-State: APuU4Z/oRgP71nQ5XVBVUiGRdL8MvTByKQBV7rGBy+oudjMiUmXy8PsH
	+SuiO996uppLb+EGMQlJgfMBg4FVjadwxm0A1JJGQklxVPnH0KMhxor85TG2XJ3xR1Qy667RNlG
	CSli+Fym+e6zWVJ5xNpqt/FxblwqpYJlTEg8wGoksWoKuaZGxpP+39OpZpINQS7rY+W+GCimv5i
	1uKadIyufWSTxaNfwcS5NVzdDMrt/XmeDccNDdydvxwLBJNok=
X-Gm-Gg: AZFdTZd4R+UVqcAJUbdqDMWa1xJwWqaNvB5OdlBoHeBlL9ImuxRp+6Gmzc8FSv5XmsG
	P1prEGDK53NCAJ6PE+zZvG4GafoBHEpH1xabe1CIMG9JHPajrsbYX82oAeTJe94gX1WA+pEvgTc
	l10PiuTKhEVVcL4+VoX+zNuXOoDcfQJCPbW2m7LoO8ne/E6J7eBVwZggtIQA==
X-Received: by 2002:a05:690e:400f:b0:67d:e460:78c1 with SMTP id 956f58d0204a3-67dec454459mr9075902d50.24.1795671355787;
        Wed, 25 Nov 2026 21:35:55 -0800 (PST)
X-Received: by 2002:a05:690e:400f:b0:67d:e460:78c1 with SMTP id
 956f58d0204a3-67dec454459mr9075896d50.24.1795671355349; Wed, 25 Nov 2026
 21:35:55 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-nvmem-byte-mask-for-split-macaddr-v3-0-c02177658f66@oss.qualcomm.com>
 <20261117-nvmem-byte-mask-for-split-macaddr-v3-1-c02177658f66@oss.qualcomm.com>
 <ef5c8902-2a55-4879-8deb-5109f7bd3cd2@kernel.org> <CAPTcHHTALv+Atqf4PKESvqRGDKf1+dPmdJCjOsy_Zpk8ZVJ2JA@mail.gmail.com>
In-Reply-To: <CAPTcHHTALv+Atqf4PKESvqRGDKf1+dPmdJCjOsy_Zpk8ZVJ2JA@mail.gmail.com>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:35:44 +0800
X-Gm-Features: Aa3M54ozoI0brzTdLEin4-PQPMiSaVHu9T3c5Nya5fB93qflgM_PLtP-EgFFRHg
Message-ID: <CAPTcHHQOLzoA0WUEVdcfC5iAy8C6YnprWjaPY-9d463swxiP3Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: nvmem: add byte-mask property for
 non-contiguous byte selection
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfXyEZKzGkkJ++0
 Na9yKKzVqdX0/xRaZoG1r/hE6rWOQ8haz4j8H9EPNbiFaBfB1XD+CX1kE4D+RH64HWd3TnR4zqh
 4hGIxdGlLB5iFreOVUDVf/hk+UQz6sw=
X-Proofpoint-ORIG-GUID: 8zRyvoWmltcaFqHgC7rU1Rqx0oWsDDz2
X-Proofpoint-GUID: 8zRyvoWmltcaFqHgC7rU1Rqx0oWsDDz2
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07c53c cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=vTvV1dd80Ivsq4zynVIA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfX6xzZx9mTYBWU
 q4sWrcxJyu5ETeHwTjeumjpNRHQc0eRx5vjTIKHcUUnp65WxNBHqvu9WXAtfzKFfU/TDwZ3a812
 AVthlCEu4kYh6r76UOs02hCLYmTYkaIOOWL0J9u8dFOfYHwr6+TO2ra82mv8QT0H0SF3d9kNN5I
 SAHI0sOpBM657nmg5t+H9mD16QFQB18SyNzE0Vznpom7jIakMA+YlDxXqe4Ima5p0QkiMrBOGJI
 RBpATH8mnSBUCy2bZ2UOOsGaWseZ0A4L1W3aR0S9MSi3/cFiyQMFzBnJiA4aCmbpbq36wIHuNkM
 86pUYxy9nAH7C0kQ58IE5iYLmv39E9Qk0F2UaBzbS31hKWHtXnqSYfiV5zWZWCDM0i628N59cLn
 YOhzYZZ8bhokYhCLzfTd/yTa1bu9FIBDSE1WbieMjT3kOIFeiTpoMD0OUSTIQ/2MwD0L5avD7+c
 Ijk40vdjVoAZc+hUE8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260021

HI, Srinivas

May I know if you got a chance to check the comments I posted 8 days
ago? Expecting your further feedback, thanks.

Best Regards,
Hongmei Xu

On Wed, Nov 18, 2026 at 11:20=E2=80=AFAM Hongmei Xu <hongmei.xu@oss.qualcom=
m.com> wrote:
>
> On Tue, Nov 17, 2026 at 11:29=E2=80=AFPM Srinivas Kandagatla <srini@kerne=
l.org> wrote:
> >
> >
> >
> > On 11/17/26 6:04 AM, Hongmei Xu wrote:
> > > Add the byte-mask property to the fixed-cell binding. This allows
> > > selecting non-contiguous physical bytes from an NVMEM region to form
> > > a logical cell value.
> > >
> > > Some SoCs (e.g. Qualcomm efuse controllers) store a logical value suc=
h
> > > as a MAC address across non-contiguous physical bytes, with one or mo=
re
> > > bytes in between reserved or unused. byte-mask lets the DT describe t=
his
> > > directly in the fixed-cell binding without requiring a device-specifi=
c
> > > provider for a common pattern.
> >
> > Pl take a look at layouts, which does exactly what you are trying to do=
.
> >
> > --srini
> >
> Thanks for the review. Do you mean there is already a driver in
> nvmem/layout that implements the same functionality as byte-mask?
> I looked at all the existing layout drivers. onie-tlv and sl28vpd
> parse proprietary binary formats at runtime =E2=80=94 the cell structure =
is
> unknown until the device is read. fixed-layout just wraps
> nvmem_add_cells_from_dt() for standard cells. None of them handle
> statically-described non-contiguous byte selection.
>
> Or do you mean I should implement byte-mask as a new layout driver? If
> so, the concern with this approach is that byte-mask is
> hardware-agnostic =E2=80=94 any NVMEM provider with scrambled byte order =
could
> benefit from it, just as any provider can use bits for contiguous bit
> selection. A per-platform layout driver would duplicate the same
> byte-compaction logic across every platform that needs it, while
> implementing it in core (similar to bits) makes it universally
> available.
>
> Could you clarify if I'm missing something, or share any concern with
> the core approach?
>
> Best Regards,
> Hongmei Xu
