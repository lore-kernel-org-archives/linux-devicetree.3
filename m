Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794972058;
	b=degQYGH/nVo9LCiWc1F2XklsIz5y4UN6OVEv8zIKAuz1U1pIyXBNwDFcfEhcOTP4M8Sl
	 3IxYzga5LyB9Azldy/yKOoAP3tlqSv+azu46dPAi3riV7WndW86M/LARKZFYqq5AspFJj
	 jiZkobtsWx53G6ZgPSgNTTtLmGAirjMHcYVBL5bHQ+kaWoNRTX2ZeXvfvOYebvEGw435Q
	 CYf6r2r6gdeURTs5U7UKG/D+TjF/uIB9YyLLALAvDcvUr93dEhyjvSyT6DmEjS2SdaJBs
	 LrxbuBPyU+YYvVIiHE2MATjYbGi46HItW1QYQR1BG1cjaJXvpQ9vLVbvvGwMOfI6hDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972058;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6zBwahOvwD+DAL7Tr2AsdmugxqryOiG1hPbX8Ut/PPk=;
	b=sq6CubdAn2SvyCbfi/0DmQEbfGBNcWoP2CFwnZvJi83Vs0Ab8S+wG1DrG+NFonpYQ/K9
	 QpOvArYsy9OpAzcXkyNJmJNAcB3U1/i8Z0lGZ7+cOY9ZUgMNZ7VUQpMxqDw9GkirkwzOd
	 /yDZEqXzxsga3Ch1CZ/pJOgcGu34SfYZpNG9U2SFX6BLihmNYi2tHqwZQO9QYInjhyjM6
	 EUSC/fVgntyPcMSvUBoqxCKKxZ9Uau4eCug8WH3zOpWPbLI9O2IlT1M9LZ+doGZ78XRxW
	 Woya55NR9bb08dccD4fLdlY3c2EDjXQLQY5MZCqZk18tossS4zto8eaCgOlSBFTJ4rQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d97xzqa6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ej7tPv05;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433CC606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 433CC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d97xzqa6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ej7tPv05
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Vw2s4059979
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6zBwahOvwD+DAL7Tr2AsdmugxqryOiG1hPbX8Ut/PPk=; b=d97xzqa6LQ7Dk98q
	i91jwJv6I43Oovg2DWMbwMpEGlG1mNf5lnC9PpgMtJ/6CBONHDZbq8YM+/M5VkJw
	TBdmjDd4nlEt7IBghIOWaEt/FszuSHWIP04O0DuvDyhtiqKUMdqzGHfCqgQfscpH
	yWWoTVN5FBWkz4YFZbqQfnPV/lvsEw/yzvA9kshZXFngJYH5I8GczGLKh6uDyADJ
	DZt/7mHPBIoQ9/Lj4AZVXcpjzDajwXhyqXnXirvPvPO4HhEomiNt1PDe/l9uv1DG
	Or/nRAnYZSROqBPuZwzDT1gV0/est4J10AvEo/0HmmDVgFyraoI9f09YOeij2DYb
	uoOYAg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvcgym6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:20:56 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b4bfc0b441so7584087b3.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:20:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794972056; cv=none;
        d=google.com; s=arc-20260327;
        b=i7t+joVq2ypq32xlQJMhdGANU4SAm4iRHeG5m4Xoau0VOR1AwqhzZiNXWrAMTcwp95
         BdwXr6vvouIUdCAN1G7uNCl55UQCcHiR6wBfxpLGTRwtF/jK3DnaMv5cvRiYbHZ3LqQD
         iDfFYNL+8BmbPkj+U/Q8lmoqGxTUE+v8sKZ/t4D6CfsXthanOOvVdzCHyE6CG+dJQruF
         xRuOM59gzO6Cz+xuPwAiDSHFNKOGDaI82ubV0BIXcoJHvTk+r5O2nLdjezHMwsBpwOgu
         CBFd8CzdALYt1F5snr/nUEx/HktugPAmgCZzCKw5AMu3vdl0c0JUvcU8BkNfhChLPgyW
         zF3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6zBwahOvwD+DAL7Tr2AsdmugxqryOiG1hPbX8Ut/PPk=;
        fh=pGN4XBeLhhM92TaTZtfeHLqPJrptbA4lLnKA5Ri3faY=;
        b=AUHKnVJHMOwveDQRYBYsw67GxCPaZuvuRfDf8zxpQ+QY4W+tIQZHa3S6J0Pt6DeTmB
         tHyguF8XeKIjWh60AKXptN3ytQfclbIHVV3weDNwX3cyW49HcNS2WN+6E+VL9sTYY0EG
         e4u5Im4eouZA8FcGoh/WxszUUGqA3zVGwDahFORsYgxYMUYb4XaN7dSO3aCPo3MDi3RO
         5CoOhLE5PpDLVfdnuQ+JJxEFQvTNQW+kqz4TwwIQFL3zlvTmCQZk1AEi7x7owgdUYJ5w
         AqElGVUpfGdAyd3Owji0fl+ZlLfwRNzbpJk56AjcqAuDNCZrBDlhjcBiL+zdAtcB2rFE
         g7qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794972056; x=1795576856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6zBwahOvwD+DAL7Tr2AsdmugxqryOiG1hPbX8Ut/PPk=;
        b=ej7tPv05esCSswuwjXdeRHM+uvgTbjx5/HIzYSl9DYDc0uez9J7t7/VtY9mqEAWfDU
         D487S4rqcRK99G7FiqJj9TzvJ2jEYitT52InaF6Kuz5LX+NojMnd4Fr7xPUMRiJThoWr
         0oQ+b1Pcs6xmnzJOcdSzjp9PMxUOtrendv59tHEAY9A9+ekWHa/78A0JZnpnb5eotMoI
         L0vHSt0YMIhuSZWw+2HmPNIrBXheqt+Y+bSagoJTyggMsJ6X6jVUDJfzgv5ABe7os6w3
         Z4a0mVnKw/UuYkU73IrRjpsT8Ug5eEUOOTo2G8EdaUETTgL2SETEpi4frKVGo8Jiptv0
         B7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794972056; x=1795576856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zBwahOvwD+DAL7Tr2AsdmugxqryOiG1hPbX8Ut/PPk=;
        b=of22ACmMncscGoVzAAERXsAmnBER9sbRmVLmaJPqbek/4qTQQaiQygP1s+ea7ggzfS
         crfBEg824Ij0Xu+rCPfmGmbOf1I8lva2d1eaCFfVQxi7PUgD9y7z0m8kxlK2G1i6mEo4
         70sbom53GhEtL6JlujU+Bh0/KOOYmmyyaFf0/sSTfX8T3t17Sq+B+Uz0XEXPxTtyiheq
         /j3KIwVNu0iEFh/ATTw2QU8PaJh+L9d28dYUgoGQE9uTbnkPLlY3BIbK329W9E8z/g3W
         TWdCtPfjmV6f/mkTwTuNoLGIg0ctOmi+lCTo01kDMXOogm+uCL5QMQdhUYSRWS9WTU3e
         PNxg==
X-Forwarded-Encrypted: i=1; AL+hErHpCS6oSyjSJp6flvwA6tE7BrS9AS2dSaNJ4NbMeso5A1nWHTCnQ7zSGewiOfNlkcMHyphcbhZIYkDT@vger.kernel.org
X-Gm-Message-State: APuU4Z8+R/mmxjQEAa+Ygxo3YLy+yNriCouxKXTqmIRoYTKChhS5tTzy
	9Z3THqMhi2G2h/sXf/MFkdkv4Ro7Oa8e51Y8Iu+7hTj1QXHxThf5h2VdufVhvwwuYymnlkFoQlI
	3xA/XA2qKcIxEJDN3aobqF35biIINq/VqRmzzePYeCGCphW/5ViU9Z+jfybY3Nv00uiVKbSw1Fj
	x8WZ0+7V6RlU8xiixeiB88frrK7ImDVTqMVFwvR6Y=
X-Gm-Gg: AZFdTZdpThDrADAs2lmXibYFWDJSNCLo3SZ007GdNr4Pw4Piq3lQtBJHXO8OIVNxm56
	cqS61ER7L1FUE9uSr8e4+5Jf7a0wLemzBveeaRR2PvzYP38E1Nb0l59PC0PErrGoukXqbdQGTiZ
	FA8tG7BdqslBkZ3KNeuSnHQDWpr3KX3f3nIebbDhSwaG+zfUspSTcgv3WFkA==
X-Received: by 2002:a05:690c:3682:b0:8b3:5a91:61e8 with SMTP id 00721157ae682-8b4fedf227amr5438997b3.69.1794972056369;
        Tue, 17 Nov 2026 19:20:56 -0800 (PST)
X-Received: by 2002:a05:690c:3682:b0:8b3:5a91:61e8 with SMTP id
 00721157ae682-8b4fedf227amr5438907b3.69.1794972055754; Tue, 17 Nov 2026
 19:20:55 -0800 (PST)
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
 <ef5c8902-2a55-4879-8deb-5109f7bd3cd2@kernel.org>
In-Reply-To: <ef5c8902-2a55-4879-8deb-5109f7bd3cd2@kernel.org>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:20:44 +0800
X-Gm-Features: AclHuK8GIBy0xoigIsjIO5R7OGYBUdDSTyKIaJPZM9Gy857UuVUIg3lY6I_v8mU
Message-ID: <CAPTcHHTALv+Atqf4PKESvqRGDKf1+dPmdJCjOsy_Zpk8ZVJ2JA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: nvmem: add byte-mask property for
 non-contiguous byte selection
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd1998 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=-c4twqntNXxB6aNGM2cA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: ZzY8usNQ8yJwQrhIBcD_agobnQFXthui
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfX80mVH9Icsqw6
 ArdiY3z09JEvrO1UkQgME2+Y00DpWQGNZZrXMg48qyx97ZbNRNln60wc0p9aPcAe4i0ZZKcNjfj
 WWxQF05hIP+27c4Z6+v89FuyUTaj4Lc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfXw6t+XZH9l2P/
 vXDGQpxrGRI23NyalTltjemdvBO+mTNXfu16oq9ddvA5NM/7s6lTLkSOQJEqVWGPxMxZiN+nvGg
 o7BxznNFLLmIpFi5znvN//q8gTx9+Q1ye3ZKrgP7w66bTikzwFNtsNvZMVMkLwx47slz6FlysZD
 JUGs1LTCkxBlxj9fTKTXwJQtZekqXgs6YWr7MqVgIdN8BWBrCiY76JnjZ0yVo/Hq8tdU8VOU/xI
 waQ+dJeLu0ApQOMYI+cf/M+V/fCMXukHedff+ltFRA/Lrtzs5emJLyiV+MniTN7sfQy2UCtccPd
 jTq7d/wnPm1gjq+dVCbbr7g70qFuknO8zWQJrsWTswX2NQ3pULTu9oOMvgFzewAzRimwFF0pfqS
 ihhjjtslHAOvFVpe6iw5zs/3GHpyATs47UONGBOW5fA2ZbUwXHwPgIAbwX7SOC6jzIf+abFMMKV
 S3HOQewZkFEUpXnfrKg==
X-Proofpoint-ORIG-GUID: ZzY8usNQ8yJwQrhIBcD_agobnQFXthui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180013

On Tue, Nov 17, 2026 at 11:29=E2=80=AFPM Srinivas Kandagatla <srini@kernel.=
org> wrote:
>
>
>
> On 11/17/26 6:04 AM, Hongmei Xu wrote:
> > Add the byte-mask property to the fixed-cell binding. This allows
> > selecting non-contiguous physical bytes from an NVMEM region to form
> > a logical cell value.
> >
> > Some SoCs (e.g. Qualcomm efuse controllers) store a logical value such
> > as a MAC address across non-contiguous physical bytes, with one or more
> > bytes in between reserved or unused. byte-mask lets the DT describe thi=
s
> > directly in the fixed-cell binding without requiring a device-specific
> > provider for a common pattern.
>
> Pl take a look at layouts, which does exactly what you are trying to do.
>
> --srini
>
Thanks for the review. Do you mean there is already a driver in
nvmem/layout that implements the same functionality as byte-mask?
I looked at all the existing layout drivers. onie-tlv and sl28vpd
parse proprietary binary formats at runtime =E2=80=94 the cell structure is
unknown until the device is read. fixed-layout just wraps
nvmem_add_cells_from_dt() for standard cells. None of them handle
statically-described non-contiguous byte selection.

Or do you mean I should implement byte-mask as a new layout driver? If
so, the concern with this approach is that byte-mask is
hardware-agnostic =E2=80=94 any NVMEM provider with scrambled byte order co=
uld
benefit from it, just as any provider can use bits for contiguous bit
selection. A per-platform layout driver would duplicate the same
byte-compaction logic across every platform that needs it, while
implementing it in core (similar to bits) makes it universally
available.

Could you clarify if I'm missing something, or share any concern with
the core approach?

Best Regards,
Hongmei Xu
