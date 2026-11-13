Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794563148;
	b=emOWY9tl5+TY62wF++04Gaf7fECjABhdDO0pvCJHJ7ItYXXcQAINZYU2+L4UaZX/Gn37
	 4eq7fnhQDtrgh0wjVvaPF51jXG6yYnA7XBYrpRfCZD4tDOvUuu9kWAJc2Nj12/srhuIk7
	 Ke/sttiXlacvg0D7G4ZrlmZy/wYwp0POQ7ryMc3HSXca7LNNq/MwEPqzYCvSh3fN0uwvn
	 e//F4rQ7FHe11aTFMImYqIpi4eH+9QDiH4evVaC8xSaYLOyOmf25g+S1hT1pNmdtjU/YB
	 BhEC47WREUUum7zCWAsFysjKFt2jPxBauvJVXtxlR1HBp7dVLuhQzDGVqL3usO4aaIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563148;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tSfUT4sU0xnYAx/hf7+EtPWA5MZ+dVpgyqFniBJTRTU=;
	b=VPqLkl4kadvD1AeF5X5/0QLg8iSl5WfsM9TOhZsf3+PEf/4TE8r1WXi36M9iJZsEIo+b
	 w0cnvTffgAQ5kgiNAjJ51JYsLa0vIoOekmQ4xCy5Ygu+qRLwi4GBxLN9n3GpRD3s2vstt
	 fCAPiL7IPDSVwv8cuiNvZMXf5gCvWxLhfeTFHo2VLjQy3pUqRqpeGCvSgXGrBJ+f0DMRd
	 QyzgLBJm6dgf9qiqWaSMXUIUyKu7EAcuUiuJZiTzxml7JDHLfM9kryefS6OSriYGuo97B
	 cNKH0jAGDzfBjaIlrV/6xuWr0b54mPtTapXxoJoNhREyD6cwLsjRYorxKfA/FW80+Gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="OkOD/f9z";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iYVOa3pe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB916606A31C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB916606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OkOD/f9z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iYVOa3pe
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V74B913677
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSfUT4sU0xnYAx/hf7+EtPWA5MZ+dVpgyqFniBJTRTU=; b=OkOD/f9zdTuGaP7w
	jqtlskGQUwqjU93rE7hmeAZ+xgb3WMSNvnghDBqcU2ZIzDuOYaZyD7eFalKktnZP
	WPSFCsIsnqm9Dt6VO7tRWHfiCDKq/Bn+iVVWGmQJR06UmRgO7xQr1qC2mgheI52u
	rU1r5dqhcGzJkpAmo7hvyCvfOpjjTLbqZsgyPXntwdVS/L86kjNGzduu0U+865am
	K6QdCDLUfVis4CLFbbnzNwT3yP2gyMsB6Pvid+sF5iLJ9+rWKPqm7sSwypoXapeC
	cbKLzYQdqPgKDI/pvTlLSnl7lidNZa/xRtjFILO2HeR5oR2h9hF7VHH7y73gu8ks
	KioDpQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx34gvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:45:46 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67c2a9fc7f5so943727d50.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 01:45:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794563146; cv=none;
        d=google.com; s=arc-20260327;
        b=alwOHJratC6/CBfwyYyvOy8m/N4eO51YGkbEE4+Xn4uKPVZafx3LWy6/VD2NZqq1gE
         VWB692sZ5wTCgSmBTOImgjoLAMcQ7xWZ4U1Wd0Mt2FmzvQZC9jKZ1hyQXutTjWmZB1Xf
         sgakvDXXOf/hgMLzzUPP/Oq2rnQHZBFoEX1HSKsFRRNkTdyds0Ivb+Df/NLUbPP6BUgh
         YE4f5DGj/n4nsl31OLRXYwYWN0PHHP52khannihHTJYcKqN/73/8yowTzOPTIn71rau1
         FeeVIRavOdoVCHHrAme8+uzAzdERdiOmfFXyDvwS+V6hR+eVXauveQ16Weh+nWvWW4Hc
         coLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tSfUT4sU0xnYAx/hf7+EtPWA5MZ+dVpgyqFniBJTRTU=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=MSeVfKSwaS3qq+uj14XeTlFyDs5Dw2TwNtBQeSF9dUxVnU1ZXqURCwxnAxF0QqxK+F
         Jqkuxu3oLPKTf1lVFoWlG/thnY9O/If3FBqx3nSdVBgfoulEGemsw9Z19lhHUXskBw72
         /uXb0mP7r2qVQ89N8JbXtF/NhfO4Jayya95eBurl1LGKEUgxbOm7tTlaAjqmz6e6Oh09
         tau/hTjJyE/1fzVHx6eu8pXheHRV+hSMjNrkVC+k6cgYIUVKt0w+z3IDhlL9DGH1aPgp
         wrimLYwpn7hhRTLuuaJd1p2xtxrsV6PTu5cA+Lwi930Iza+Ah8TUHTfuNRCOsPwNoQG6
         wsaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794563146; x=1795167946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tSfUT4sU0xnYAx/hf7+EtPWA5MZ+dVpgyqFniBJTRTU=;
        b=iYVOa3peOD+2gK8TI3WbvCcFOAMEnDdn5lxq41yz1O8TAFeLBdc9oW6WBBCKi/cEEk
         c/u9VPuVbKF8L7FmEE0RsIZLtXKLcLIzUvDfjhMXluKiYMAKTxcLhEw9szowgwvVtVTL
         CwKiqXIZLA/X2Iyb+IEVakBdnwnALQvLCKvCCW/NuCi4QYugYVlL4CSTH2ELYTfK6sRs
         Vi3aGeIfUoiw/6q+RWFglbwAdkyL6i0t1OoZp2FFEE5NsxCCPT8At3IqX+Mob9YgwlpS
         a+7BsLprNfPdBUfTWPC/lzRGXpbnV5+y/Finx0/qkoc998OUA3LOB1jpdc3egEKkfwnV
         frag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563146; x=1795167946;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSfUT4sU0xnYAx/hf7+EtPWA5MZ+dVpgyqFniBJTRTU=;
        b=uNJ4CGrLPC2XKbGWiKIJy5eEWprGX4qMxxhomJULGb7BnL5lwsADyzkR4REFcrwuMm
         nd6/BvCxnfg9nxrWZsEjyYS+Fv6yv5BupSa+8XLwaswmcQBNFdgCJwWboDU/Ckw4q9Op
         2se+YDrc3j51WOCkTnq+h+EroFI0QDptwa/MPLba0wHtAndiU62AfWr9vH1r+tU12O2h
         ztcJibCLQNqUOdWCVvpTh39VHnAfYT9wx2Teqvsj/uHSWv7TQiEGairNXFCKsOmlTMCc
         mEkUWVathNSTVN1cOoclhD3uRX4nosoVR6BC60WthEl260JpIQ33A8g8ECFH2LQfGZTx
         Z/Mg==
X-Gm-Message-State: APuU4Z+g0rF4DeeyPMkvgcBS/8vtoVfAmDCafMgMkuckaFMot0u+4CHU
	0O/DmAYNLwYhO+6VlgmfJCmefmvAKjY6FIKnVUpBawmaD317LBLb02SrcInDK6q7SZZwx/NGgRR
	L8BqFB9Zq6SqG/ItPnhF4Lzb8+hJ96ZogtP0fHoamCoyotOnpX0lWUkg2lQgUTfDbivg1s2H/Yt
	0653dENeY+6iyO6+n6wWe86Nashr3vBwfl/UEi6UOfo+vLApF7Aw==
X-Gm-Gg: AYBFou15eHNWdIKrCAydEbAeEpy2eRF6RrB/uMISFfzfc/dide+IAoRlutXF9+upYKH
	JhNPDx45j90ayfGhf+mQXpEAgGlreg1ZUdF4falK1XJTeCAk9wjnwdvoC4BZ/ar89JoSr7zA/Gh
	MBvgDqL88FTcGp7KQLMuqrInqg1ykkbyjEVnOw7RyvHBcuNw8W6pugYKdQ1Q==
X-Received: by 2002:a05:690e:4086:b0:67c:2350:5b81 with SMTP id 956f58d0204a3-67d895a7c43mr1403135d50.30.1794563146076;
        Fri, 13 Nov 2026 01:45:46 -0800 (PST)
X-Received: by 2002:a05:690e:4086:b0:67c:2350:5b81 with SMTP id
 956f58d0204a3-67d895a7c43mr1403125d50.30.1794563145637; Fri, 13 Nov 2026
 01:45:45 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-nvmem-byte-mask-for-split-macaddr-v1-0-138f715f18c1@oss.qualcomm.com>
 <20261113-nvmem-byte-mask-for-split-macaddr-v1-1-138f715f18c1@oss.qualcomm.com>
 <sashiko-outbox-212378@kernel.org>
In-Reply-To: <sashiko-outbox-212378@kernel.org>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 17:45:34 +0800
X-Gm-Features: AclHuK89gL7kvEUVcuZW_xgjh-GrEr5sPSzlQ_xFuAhZu-sd_zL4bxOwpTgENQg
Message-ID: <CAPTcHHRXttk+sxr4Bevet3kSNZRD3SU3ma0PRFCEsg89aH_53g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: add byte-mask property for
 non-contiguous byte selection
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af6dc4a cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=-yBQcdRjb_lw1M2xZpIA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfX20Wb5NHGzCd5
 fDfWE05BQtKVqXPP4/jbfbrt5eDrrPRZnnQPKwVfGozfbnFCRc23G7q3S7td9KQufjhaF8+JVur
 j+agY0NGBgNIB0l+ubhVN6MlB/GC+DUrpcQLhO9VmUxS2hHjhVkJO1Xu1vZPTVyktlAYDj4I0xN
 w5i69xla3hBT/CBdxKSJYunFZsc7/Rc0nhawOeU/smqTpwmQAtRdsd7Pnn8O9aYmwHsjfOCfogd
 cch9MkYoDWi12J06A05Ol2M6p7sbwVA81XTC9igp2+F3AInffZOq6FBzaOQnIvll5S1akl8lonG
 UG3q5bCz0bMeTyimJBcoDszSblL3Mod/wV2qfLoROX+PbdmHmMmeqOImFnDexcsgflWXVch3KMa
 JZkGY6gj6qQgYquNhMvGOrKv64xHZLbODZipKDt+fpTtBoCN5EQJO6r6zpNOHGHiLUc41/uO4WQ
 NITaM5tKW4FAH6Z8hew==
X-Proofpoint-ORIG-GUID: COrg548jzQaas7DjiRi-28CYTOYQemg9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfX+m7fIEWPMfuq
 oABjEV2j79d1Cq4ie4jfKtH0QTgYBSmD4Z1dFnsFctoaL2oTWUGvPnIt+xC95J3L+lKqeRaWxg7
 I5xvY+jEJQ7usAqZuuafmbfAAQaH1+c=
X-Proofpoint-GUID: COrg548jzQaas7DjiRi-28CYTOYQemg9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130038

On Fri, Nov 13, 2026 at 4:02=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] dt-bindings: nvmem: byte-mask redefines reg size and accesses
>   beyond reg
> - [Low] dt-bindings: nvmem: missing hardware motivation for byte-mask in
>   changelog
> --
>
> commit f8160f5bc1c29ed4ba48f6d458beb8ca96b09427
> Author: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
>
> > dt-bindings: nvmem: add byte-mask property for non-contiguous byte sele=
ction
> >
> > Add the byte-mask property to the fixed-cell binding. This allows
> > selecting non-contiguous physical bytes from an NVMEM region to form
> > a logical cell value.
> >
> > Bit N set in byte-mask means physical byte N relative to the cell's
> > base offset is included in the output; selected bytes are packed into
> > the output buffer in ascending byte order. If fewer bytes are selected
> > than the cell's logical size given by reg, the remaining output bytes
> > are zero-filled. The number of set bits must not exceed the cell's
> > logical size given by reg. byte-mask and bits are mutually exclusive.
> >
> > Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
>
> [Severity: Low]
> Could the commit message explain the hardware layout that motivates
> byte-mask? It repeats the property rules from the schema, but does not
> describe which SoC or NVMEM layout splits a logical cell across
> non-contiguous physical bytes or why existing mechanisms such as multiple
> reg entries or a device-specific layout are insufficient.
>
Example and explanation shared in the series cover letter already.

> > diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell=
.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> > index 38e3ad50ff4fb..cddda3f706917 100644
> > --- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> > +++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> > @@ -34,6 +34,21 @@ properties:
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
> > +      packed into the output buffer in ascending byte order. If fewer =
bytes
> > +      are selected than the cell's logical size given by reg, the rema=
ining
> > +      output bytes are zero-filled. Byte positions are relative to the=
 cell's
> > +      base offset and limited to a 32-byte window. The highest set bit=
 must
> > +      not reference a byte beyond the device size. The number of set b=
its must
> > +      not exceed the cell's logical size given by reg. Cannot be used
> > +      together with bits.
>
> [Severity: Medium]
> Does byte-mask conflict with standard reg semantics by treating the reg
> size as a logical output buffer size while reading physical bytes outside
> the reg range?
>
> Any non-contiguous selection of K bytes spans at least K + 1 physical
> bytes (highest set bit H >=3D K). A Devicetree author must then either se=
t
> the reg size to K and access physical bytes up to offset + H outside the
> declared reg range, hiding overlaps with sibling cells, or set the reg
> size to the physical span M >=3D H + 1, which pads the output to M bytes =
and
> breaks typed consumers like nvmem_cell_read_u32() that require the cell
> size to match sizeof(*val).
>
reg size is the logical output size, physical access is bounded by the
nvmem device size =E2=80=94 not by reg.
The validation in nvmem_validate_byte_mask() explicitly checks:
if (fls(info->byte_mask) > nvmem->size - info->offset)
    return -EINVAL;

> Defining software zero-padding in reg also puts buffer formatting policy
> into the hardware description, and the binding leaves write semantics for
> cells with byte-mask undefined.
>
will fix this.
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-nvmem-by=
te-mask-for-split-macaddr-v1-0-138f715f18c1@oss.qualcomm.com?part=3D1

pw-bot: cr

Regards,
Hongmei Xu
