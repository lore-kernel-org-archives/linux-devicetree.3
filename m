Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9437D376BC6
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 21:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785619151; cv=none; b=E2VZ9t4OQb84e9qE0Y0TTYH2KIUCXdbchxvgKQhoEOYpLm6Dq9p+Mtd6IHwWCfVFk4fq7pUm58jiYviDaxO5Wi0wx/ODSzj76iKxurU5D5Dt4ykltbTHqAJz7wVlGRY6CMAJdqnqSTxxii767JCwFQxW9qt+AvBwWI5J7fNKZhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785619151; c=relaxed/simple;
	bh=0jUw3tjQQAofN4N6n/gV9gE1tx3+16RRsto/cu8hlro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hxWcgtbMhWiIhm6AodRh9EoxV8zpuxX+OfSvYwHmGztLVTjZ/85xQb3QBXIgYMaiee9dbWEwiTtG4itYNQKmfs4Y3iyoyp7wEc0LAVBenS+FUgpPyP/DM6HIhL2mQlmUFG2NKrj90YSnI2hetUCCn7Sh6wLoFAfK9Rwhy/VEjoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CpCLYbiR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iu4SwXcH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CpCLYbiR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iu4SwXcH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671IxbfR3846656
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 21:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P2otRJj+9cvxwazAN+jx4u3zSSSqBcvHsk6vMl6Bhfk=; b=CpCLYbiRBW6xXPaz
	OGwudNRwgSYj2whGmjMQbWimsj9dO4qHvcVTWPOrXEMeC43GsNgObRX8Hn7MAqBH
	gPiewQGoCW2RSrGbOyU90z6q3qHZuC0wGMes62aeSp8KWEvkMHO3cVeAir/m2mpY
	MV6zBlSBCaCH/vc3mhSx06lUt6K4CZ20MRXiFlrCir5cxjfHOAgWKVUcwdWVBJwu
	kPlwuvG0OA5tImCkpTog1cDt88oeJhR+iEd/LvC5J97iacfXYzF6T7t/iKpjUikt
	WRK8Tzzbugu6KKHay41Qi1Vsrcyu5tOXiIU8NUBiaN2Tyfn3tzjEKkaYP/sezXo/
	7sm0jg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8vt9sgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 21:19:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8db414c7so30130671cf.0
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 14:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785619148; x=1786223948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P2otRJj+9cvxwazAN+jx4u3zSSSqBcvHsk6vMl6Bhfk=;
        b=Iu4SwXcH2/2FG+NP2FVHVWiPVr8QOwXA3prAv6ll3Y1gNNElJdx3YSmhxgUBrSYLob
         cpWsOK2LhpNYQliThOcCU2mSrcyHtRztkOA7NO2ePxo5B1DoGQPFzzTeZuljfwAEJ1EM
         mdWvLKzHxHVX8UtjHBZBhIzMyajC93qlwxzlzpVoqdLiAzXmNkWOqECR9bsfjscWhpwq
         V23bxU2vnkApUPnz6HMhafqnBcjNghNG4ouOUGZ2QW54bzVjb/fEEU7djlWLRLnETauo
         QG2VzMddWHzCzbhgUQvZz3oelghrKxDIHozFt2TXNwBzpvoFbW4H70lC5XKxzjYBIz71
         jPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785619148; x=1786223948;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2otRJj+9cvxwazAN+jx4u3zSSSqBcvHsk6vMl6Bhfk=;
        b=PZdBn63sIsUfSvk9/gEoirwdaFusDbZWye0lDU9ekG7G/Hi/ubtjY88GQaGlLodJ8X
         uaj9swyd1tXAznamc+KSAlerdSmA1shYdnnjlOJ1yzVPQNezhcgEq2DRMHCw0OlWNLu9
         evMk6mF0nRe+qM1eRxfwqEKKsXmBaMA6f808AcbgskHArexypGHtnsy/1LL2PqRa6epq
         nd4KU0CJphhaFXKAge+sDP3CFu9JDTqAQczv6f39LIx/EJSySCt8iT81x5Zo4KX7r/KU
         WYoHZ3EriC7FcQr61r61a/q84IdkrNHi3IR8zJzWQJbwFFczEScQuK68Rymeu+Ed65n3
         WeSQ==
X-Gm-Message-State: AOJu0YwmTLzj+URvS8agsIYsi3ipe8qeJfrJiOVCrqtvayazt9lTipea
	ZvGrUEW9PpgNUkbi5/VsjIaATeKahnhm4TpyQuW3zjOwSjfP+Lrp3n/meEE/eT4cTs9ld72/7XB
	p2+RcnmKdamOGB3DZXeKVo9PCY7AxB7ZxJKuxipqIvuISXaj7uM2/INDquGIUScLpn5zYd3va
X-Gm-Gg: AR+sD13jDPOFAdurIH3VIxAghGAA7ozniZHA4ZeGwQaeSLmVXm5EsQaZvOa5pEwvXe1
	Ow1MvIEPAuJlxtiH6iw4I1nuxMpzS+ofAgzHCMb9w6Kj1DXp7dge88VVgNpXA5PYXYFO62eVPir
	NfDeY5LzSgi6P7JUKSqRGBE0MHxRX6npbmn4qz1GCaOuo+wHKWFj8SO5K99w4qLph6J7/wgl5TJ
	drhbpFBhGvXh+ihmatMUdbFnrrGbd8qn/GYaTDyRjY4Z8Lth4Daqdr1xQwTITo7vOmIErNmropB
	MlGnSEgxfkaxr9rkTG45A/fLoVw0R8arZzyLrJLdBBJxVQvDQn6y4VZufOvKhOGOJEegW4YRpAu
	JsytvDWaZmBiG06OOmaEAIWVEw8yLzQ==
X-Received: by 2002:ac8:7fc4:0:b0:517:a7ff:935f with SMTP id d75a77b69052e-52b5666b775mr91263761cf.9.1785619147608;
        Sat, 01 Aug 2026 14:19:07 -0700 (PDT)
X-Received: by 2002:ac8:7fc4:0:b0:517:a7ff:935f with SMTP id d75a77b69052e-52b5666b775mr91263501cf.9.1785619147193;
        Sat, 01 Aug 2026 14:19:07 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4981248661csm5262275e9.3.2026.08.01.14.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 14:19:05 -0700 (PDT)
Message-ID: <7177d789-5544-43ad-977a-faf64681788c@oss.qualcomm.com>
Date: Sat, 1 Aug 2026 23:19:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] dtc: dt-check-style: Handle sorting of top-level
 nodes and properties
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
 <20260726-n-dts-style-checker-continued-v1-4-b05b8f897670@oss.qualcomm.com>
 <20260726155702.DA55C1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260726155702.DA55C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE3MiBTYWx0ZWRfX7n2kpayaLcNe
 0ofrm6y39FfCIWpDlF+dpwYtRyhccXPGnDwqewAMVwK879w5hWWU0Ft5gR63iqnX609RWbDZh4v
 ot2FhMzyObRhs5GS/z5w+r8AfvKKVkg=
X-Proofpoint-ORIG-GUID: RnEQqL7i7iCuQh5aEhpvFcBScH-Q92xB
X-Proofpoint-GUID: RnEQqL7i7iCuQh5aEhpvFcBScH-Q92xB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE3MiBTYWx0ZWRfXxrW5oC6RTncN
 H5m1KlE10JHVqRpRJpspUOmvfq0yRokiTiNoHhDi/Gpgz47RgqtxolTWaH12eJ3e0sCejb8K/+G
 WUvA38Z24Jc/q3HnyxkueDlsEj8GBAKHpChda9EIePXqoWN80cy8ls60dSfhlEJc787yE6XcU+A
 4hb6uOD39RrBcUBWdIcgWBkiUjDG+a3A4V0p3iADJli8OgZ4ifTNE66Z9buCjzvk4F5w04GnVc1
 mZrEkEFQeL3sSY2SJDhlpwd5FZpV6+R/s4/ajLy38iEejqFMSt+qqjEdM5d//CfZvkt2MS/3mfX
 MSNjhjlxP8FYLLDEqQ8lKb00SEKua7f+73kh7wC9Zan654mYHtnQk1SeOBTRs3l2KpAyAyOoliP
 RcwsTrqXF2v0RfHaiRm13tWuyE7IG3/L/BQhA/xRlAj62IcV0Rj58cWlTUnaqhs8U/YY9WQzSt6
 bM1eBBjHxBkJ00a6tdQ==
X-Authority-Analysis: v=2.4 cv=fKMJG5ae c=1 sm=1 tr=0 ts=6a6e62cc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ijNvPFITslbISghIKdgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010172

On 26/07/2026 17:57, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] Tree hierarchy tracking in `_walk_bodies()` is broken, incorrectly assigning closed sibling nodes as parents to subsequent siblings.
> - [Medium] `_property_bucket_root()` collapses standard and vendor properties into a single bucket, breaking canonical property ordering at the root node.
> - [Medium] Top-level addressed nodes are exempted from address sorting but are never subjected to the node name sorting claimed in the commit message.
> --
> 
> --- Patch [4]: [PATCH 4/9] dtc: dt-check-style: Handle sorting of top-level nodes and properties ---
> commit d752014f34dc3d4a2a9f9617748ec741da0cb1c5
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dtc: dt-check-style: Handle sorting of top-level nodes and properties
> 
> This commit updates the DTS styling rules for top-level nodes and properties.
> It skips unit-address sorting for root nodes since they mix unit and non-unit
> addresses. It also adds a special case for the 'model' property to sort before
> 'compatible' at the root node.
> 
>> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
>> index 1937c6feb57ec..db4451e30dfbc 100755
>> --- a/scripts/dtc/dt-check-style
>> +++ b/scripts/dtc/dt-check-style
> 
> [ ... ]
> 
>> @@ -496,15 +497,21 @@ def _walk_bodies(lines):
>>      in the input. Skips ref-nodes (&label) since those don't have an
>>      intrinsic ordering."""
>>      body_stack = [[]]
>> +    node_stack = [[]]
>> +    parent_dl = None
>>      for dl in lines:
>>          if dl.linetype == LineType.NODE_OPEN:
>> +            dl.parent = parent_dl
>> +            node_stack.append(dl)
>>              body_stack[-1].append(dl)
>>              body_stack.append([])
>> +            parent_dl = dl
>>              continue
>>          if dl.linetype == LineType.NODE_CLOSE:
>>              if len(body_stack) <= 1:
>>                  # Unbalanced; ignore to avoid crashing on malformed input
>>                  continue
>> +            parent_dl = node_stack.pop()
> 
> [Severity: Medium]
> Does this pop the node that just closed instead of the actual parent?
> 
> When node_stack.pop() is called here, it returns the node that just closed
> because that was the last one appended. Does this cause subsequent siblings

That's intended, since we go up in the hierarchy. Current parent should
be now what we left on the stack.

> to incorrectly inherit their preceding closed sibling as their parent instead
> of the actual parent, corrupting the tree state for checks?
> 
> [ ... ]
> 
>> @@ -525,12 +532,18 @@ def _natural_sort_key(s):
>>  
>>  def check_child_address_order(ctx):
>>      """Addressed siblings (foo@N) must appear in ascending address
>> -    order within their parent node body."""
>> +    order within their parent node body.
>> +    Exception: Top-level in DTS follows name order, regardless of unit address
>> +    in memory@N and soc@N nodes
>> +    """
>>      for children in _walk_bodies(ctx.lines):
>>          addressed = []
>>          for c in children:
>>              if c.node_addr is None:
>>                  continue
>> +            if c.parent and c.parent.is_root:
>> +                # Top-level does not use unit address sorting usually
>> +                continue
> 
> [Severity: Medium]
> The commit message mentions that the top-level part usually chooses sorting
> by node name, not the unit address. However, looking at
> check_child_name_order() elsewhere in the file, it unconditionally skips

Valid point.

> nodes with a unit address:
> 
>     if c.node_addr is not None:
>         continue
> 
> By skipping addressed nodes here in check_child_address_order() and not
> updating check_child_name_order() to handle them, are top-level addressed
> nodes now completely excluded from any ordering enforcement?


> 
> [ ... ]
> 
>> @@ -597,6 +610,22 @@ def _property_bucket(name):
>>      return (5 if ',' in stripped else 4, None)
>>  
>>  
>> +def _property_bucket_root(name):
>> +    """Return the canonical bucket index for a property:
>> +       0 model (for root nodes only)
>> +       1 compatible
>> +    Plus a sub-key inside the bucket for fixed slots (device_type, compatible,
>> +    reg, reg-names, ranges, status). 'standard' and 'vendor' return None for
>> +    the sub-key, signalling that the within-bucket key is computed by
>> +    the pairing rules."""
>> +    stripped = name.lstrip('#')
>> +    if name == 'model':
>> +        return (0, 0)
>> +    if name == 'compatible':
>> +        return (1, 0)
>> +    return (2, None)
> 
> [Severity: Medium]
> Does returning (2, None) here for all unhandled properties override the
> standard bucketing rules for the root node?
> 
> The original _property_bucket() sorts properties into buckets (like 4 for
> standard and 5 for vendor). Because this hardcodes (2, None) for everything
> else, standard and vendor properties at the root node might now be grouped
> together and sorted alphabetically against each other, overriding the standard
> before vendor rule.

ack

Best regards,
Krzysztof
