Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794905142;
	b=JakakFgq9cRhXxp7NlPX+Zin5EnVTC13Rlhnl6RFa5PYsfYY0XEJ6v4fcqc65NpEUOFR
	 u1bP12BaDXYbeLNSyMARzSIq6CNdcai2rb8Q3mL0dxRVNolRnyaUwIF+9h2oqDehK7Tmp
	 pu0FkKqjRk/VyRLrcHOu7R3iHYW/tqIE1FSXFoRJoLxFF5gXU8EGFqiYe4Vi/HpkE2Gm4
	 P0nlcU9mB40khY3WuhTBsCTgwOknpRMJ7tJx3yIGfOjy53Pwt+4LsfyocRh4Jg6V8WcJi
	 LJZwZp/BovjR4sD78jHgrjqSLB/m8+NZLiYQQY6EzEjMKtdbVHvKzT6JuZDflwzeMzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905142;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cpkGlVy+88a+bdtERyVSo17D0wkYNFyDnapta8BFak0=;
	b=JYkh4S/BabABaOwFC1aABGm1px2/8GH1OXI2VWRDMBmuFiQr9hmPBhbd0Lvg40naQvWv
	 sq/rK5KwePma1EOzw8SHv0mXTy393ZY4d6+tZmrJP3UfbB1THspTvg0f0E3HN2G2g4ZnH
	 k1QJq7Czt+HE/WfZy9MZ4PfSC66Y2mxVSn/Ge8eebOcqXcYhc94qbJowBbmsqUEq6x3Mb
	 zwQ01NyYoskqth8YC5wPmcM+rc7UGa1eu5E2DjqGQGfAZxBrThKkzYjoOCzURonPpN+xV
	 T2Ev4N39CzTpTJ38UnGnHbOZH7AVciVhNO0IZEbaAzLn8xGUlxZMgxViPhz+ayuDwoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CmBA61fa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="PeL/PEEz";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19A0606A8AB
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F19A0606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CmBA61fa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PeL/PEEz
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8bdJP199951
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cpkGlVy+88a+bdtERyVSo17D0wkYNFyDnapta8BFak0=; b=CmBA61fawsfanpiI
	qp30JZ6FCgmIO9y2S8cC516vknjh3jEWeZ0mVF+NIEw4v2BMiGLXQRCoz8OWLB81
	SuUBqan2Mm2Mo0EZN6D0zmonZSCsRktQb/vlgOBWl6mpwBJbqbg+8uZtWjBDyODB
	3PBMnjAmot6NRjb7RAd4KZYp9BR9ZOV6zLRd7ptB73yTFX8k4CEogkWa1xbDwS7I
	AFRdDwcuavGtlFGzy6JFrwAyuewcv+tWmtXW11GZHek+sQd8vEgPD+J7k1lM0Phc
	GhZEiUuXJZ43jjbHg6X69rF2N6yckBpyM2ypT+UCnHIN4Cozi7xQ2fPhISVQK5P+
	8yp6mg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j038mbv7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:45:39 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b0d978e4faso65237537b3.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:45:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794905138; cv=none;
        d=google.com; s=arc-20260327;
        b=oTYYi8KMuor4qrShvQpOeS/qjBNM9N2OZbsbnMV7ongYRRHqcKhkYph4Jyt/GSqObt
         HBfJ6lJU5DV3XyEnrNj4Oy0sz1VpdKT8ZfE0ZeL8zKr/HnVH7Ub7uODDR0DrlftiOeFr
         vkcLPtaKCRXkV1U7J136ufELygtysRRJa9NPqhFxJk/Jam+XPP0GooXhNtAPARWtPA2H
         X48mMrfm5UZNwhajFtUcpggInWFetyYblzd5XeTueo3dOzyatHFx9bZv7zXoVwK6BXxk
         yhJe0Em91i/DE3XKvwuzcnalgLBanq621ybQRh4wIQFHDsj3nZbeWIzd8D7VxfNBE0Iu
         beIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cpkGlVy+88a+bdtERyVSo17D0wkYNFyDnapta8BFak0=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=G/9/FM1B4jVAi5wdnwIx+XA0niPezO2Mu7laParFz0ILrXGGYJDpLv6+LSTpv6tGnu
         s5i394R6dkxNztIHZ88JEqcEhrlVvYngvpMjoOr2HShqbHjn6G/sH4PTdw7qf/fVxgV/
         ZnOeEFzwpBatAmfC+eoa31tUnVK2eZvcntpNFQT4iMnjbvxrTnAxG9XON+Z7JdIuvRcu
         eTdX8MUI2HmlMJyXf7piX20w+3E2L2jk6BGrw+BVjR3jdkfM+lDy8v4vQiov7JKMXOBh
         MMeQrYZ1qHy0Q69LtBtNAdpfpnDBE9gPQqNKPSixc6oNnQ11wyEmlhfjWFNGC9BdWMCl
         8j7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905138; x=1795509938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpkGlVy+88a+bdtERyVSo17D0wkYNFyDnapta8BFak0=;
        b=PeL/PEEzM3uYGohAgcE3Vom/Ucstn2F1wJDErpecOGno0SVXcC+j8q1upOt2DQXC7X
         /MdhRexn4rwE6lxq18jeA8bS89oGiEolJSEx/qI7YNCM6PGuIAngJAT/7ZsBWEAVYX3k
         BTvtc/+I+x+ugsTretuNxYHhmEgNMr2D2BREtcrKBVwNM3vni10gs0w/GEu9BEH0a1Jn
         Wnq6maJKdt0gb8tRrsrnd8sSSRj63VhuNt12SFNASIq3u0eJ+oY9cEyGSGTSuEnKibT9
         ZcAtq71UUxm3kaJ5CVTfUlusKzfQ+rln+d+paYYM/uovVlrEKoKiUUcUjHT+sTtDwSRY
         kaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905138; x=1795509938;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpkGlVy+88a+bdtERyVSo17D0wkYNFyDnapta8BFak0=;
        b=Favvoz7pXRYVJcyDoWQ0RNd6k+hRrxG5K4EtVMbj7tbszKSzjXs0pcWV7RaL7rlA0/
         WLI9O2FUI8A+8R9o96q7YOl9AKkjTKjP6CbfK3HCONy0QIZxLQ0B9lxIJTZqIgyzfPi2
         UGJgYsDgKXN/PN0v62r6WpHliarrp9nCYikP6snRtZCZXUYhhG1AqofrxHyOW3pKVcmT
         GlqdtmlIg4uxLNCQBds5TEBj8IUwxvCwjqLrsL/+22IgGFLWXDd0gX8s8b/dxX9sKceY
         v2IKIEFJOPRoI950ZpdWsZpfOAAooXEeUkzO4RkSwD/JPvt7WLWruuosy1TKgSfBXJvQ
         Iuew==
X-Gm-Message-State: APuU4Z/vFKnsMmwNGt4wISiQ2dRSrgPucSp9GAAKXXdfB7YvZt0oSd9A
	4RxSoZitzqHVKD2uTiz/943rkHgnK+zVw+9WqXfUewtqEDejmZpBNCQabrxutgAg/F3PskMeoNz
	tJJ/BH8aQtrO2nLtgkUaGj6n1wFLIu6RvRxmqIapyEQQKCx8e4AXQFfrrbge8nDvuAom+7vSlWu
	7jBKkG0uDIgUvucQYASEqfUZf4YLjHj5vsnMnVB7k=
X-Gm-Gg: AZFdTZcHQJa9IF6YAL4ceOPghPC/Rm2NytwESNfpLbOmfEPsueM9pl3/zRYd/6KFsHM
	93j613jDngGj5SRYTZb+uUU40iBmS/ILrAjsPAyK8qXkMvNkpJuOeUYW+gF7Xkib1js2DpLuFOj
	St+qHaGT5QagAczyQCRx1qtv3j9IVhaCWhEURD3n5z5c29BRLC/RsmzWTyWw==
X-Received: by 2002:a05:690c:c6c3:b0:8b3:4122:f464 with SMTP id 00721157ae682-8b4aa2e6c45mr55426697b3.55.1794905137976;
        Tue, 17 Nov 2026 00:45:37 -0800 (PST)
X-Received: by 2002:a05:690c:c6c3:b0:8b3:4122:f464 with SMTP id
 00721157ae682-8b4aa2e6c45mr55426647b3.55.1794905137376; Tue, 17 Nov 2026
 00:45:37 -0800 (PST)
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
 <sashiko-outbox-218243@kernel.org>
In-Reply-To: <sashiko-outbox-218243@kernel.org>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:45:26 +0800
X-Gm-Features: AclHuK-BjraxiQizuRyu_wwBk7IPkDy9t9I88yuWDIxIvdsj0i58hOgBrlEV2kQ
Message-ID: <CAPTcHHR5-ByUxRUdifBO37PJTgLPDzeP6gyTbcdgf2k6BJhpOQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: nvmem: add byte-mask property for
 non-contiguous byte selection
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX4bJmVvzcEkev
 d+lu/uikG1gLRl8wzzhPF+mBp4EgBJ+RHrpsNNg0KW4creH1r5RghGuMPHwlrUz0sx0XuydB0Dr
 LTTDpyFmNLbuwsXFQZxUkUN88KbazPt9OJFcoLL8wbMe/32ao84NmOpo5YuZAuUUjI/zTu5i/+E
 X2l6uK2YQ4ouaW4imDCL6w6u5Yqjf+Ldzmhz3gsW5mXfwssKuR4gGeekVPTonJgr8d7a2YPJMWP
 LRN8tfpPmDyMnPeYjoGAtPOdpN+Xln850NO5AE3DBvpUYW+pPgFMcSl/jPoW5mi/1n1f2BHieeE
 Ew9ot4fhSumRk3w6xNmojjxCfm410CtKFVYZs8wT3HgN96QaeUYpv+5Nfo1Oz0rss5FYCkBMa9r
 sVS3Yz4GZ3PAhWqEyEgZ3103y8CHfsu+4KYILMAbmqNo3N6LSsBVX4ODbknV9j+QBD+EpWe1w5E
 e0nDAlwvKj3GSBjsqhw==
X-Authority-Analysis: v=2.4 cv=TckDJhQh c=1 sm=1 tr=0 ts=6afc1433 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=PCVpLA2prkgZY9I6f_AA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: yqen9VELKQdkchefkiRqFuuuuW2EMO3g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX6/tOwHgnjLA5
 F6L+f8KaPnJm8+mUalFF6Zu5Rs7OAMrvC4AISPI9MGDhiGv7XJUXo4YEZO7d+qV2c1SSkrK5n5D
 aLl2YulGmYcT8GmxTrUPcB1lOUnPxbg=
X-Proofpoint-GUID: yqen9VELKQdkchefkiRqFuuuuW2EMO3g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170034

On Tue, Nov 17, 2026 at 2:13=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] dt-bindings: nvmem: byte-mask redefines reg size and reads
>   beyond reg
> --
>
> commit c8ae5b67172a64e8cfa54543074f9aaa24c7c23a
> Author: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
>
> dt-bindings: nvmem: add byte-mask property for non-contiguous byte select=
ion
>
> This commit adds the byte-mask property to the fixed-cell NVMEM binding
> to allow selecting non-contiguous physical bytes within a 32-byte window.
>
> > diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell=
.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> > index 38e3ad50ff4fb..46e1101ee98ae 100644
> > --- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> > +++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> > @@ -34,6 +34,20 @@ properties:
> >          description:
> >            Size in bit within the address range specified by reg.
> >
> > +  byte-mask:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 1
> > +    description: >
> > +      Bitmask selecting which physical bytes within the NVMEM device r=
egion
> > +      contribute to this cell's output. Bit N set means physical byte =
N
> > +      relative to the cell's base offset is included; selected bytes a=
re
> > +      packed into the output buffer in ascending byte order. Byte posi=
tions
> > +      are relative to the cell's base offset and limited to a 32-byte =
window.
> > +      The highest set bit must not reference a byte beyond the device =
size.
> > +      The number of set bits must not exceed the cell's logical size g=
iven by
> > +      reg. Cannot be used together with bits. Cells using byte-mask ar=
e
> > +      read-only; write operations are not supported.
>
> [Severity: Medium]
> Does byte-mask redefine the size cell of reg as the logical output size
> instead of the physical address range spanned by the cell in the NVMEM
> device?
>
> In fixed-cell.yaml (such as the bits property right above) and nvmem.yaml=
,
> reg =3D <offset size> specifies the physical address range in the parent
> NVMEM device, and sub-range selection operates within that reg range.  Fo=
r
> any non-contiguous selection of K bytes, the highest set bit H in
> byte-mask is at least K, spanning at least K + 1 physical bytes.
>
> If a DT author sets reg =3D <offset K> to match the logical size, byte-ma=
sk
> reads physical bytes beyond the declared [offset, offset + K) reg range,
> hiding physical address overlaps between sibling cells from DT tooling an=
d
> reviewers.  Conversely, if reg =3D <offset M> covers the full physical sp=
an
> (M >=3D K + 1), the number of set bits is smaller than reg, which leaves =
the
> remaining M - K trailing bytes unspecified in the binding and causes
> consumers expecting a K-byte cell (such as nvmem_get_mac_address() or
> nvmem_cell_read_u32()) to fail on the larger cell size.
>
The choice of reg =3D <offset K> where K =3D popcount(byte_mask) is
intentional: it exposes the logical output size directly in the binding,
so that consumers such as nvmem_cell_read_u32() and
nvmem_get_mac_address() see the correct cell size without any
knowledge of byte-mask.

The physical read window (fls(byte_mask) bytes from offset) does
extend past the reg-declared range, and that is by design.
nvmem_validate_byte_mask() ensures the full physical window stays
within device bounds, so no out-of-device-bounds access occurs.
The overlap concern between sibling cells is real, but it is not new:
the existing framework does not enforce exclusivity between sibling
cell reg ranges in general; DT authors are already responsible for the
hardware layout. byte-mask does not introduce a new enforcement gap.

Regards,
Hongmei Xu
