Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5F9386423
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 06:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783491273; cv=none; b=awgzy8hcDnF6dExe17eDEH/iAgu0RGflkpSTSLNTvQnNEGrho64iRR3WvC2vlRMNv25POZI6gjXlJDidsqoFFfugTjDu5m5d6X8xIWSqWVWK/lqTHV48g1mSa6UfVQEzvDglZzaNKx+JbRqfj24ISykk1/dFDByUoy9lgGHkf3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783491273; c=relaxed/simple;
	bh=31DBZk7X/hN3QcM58n1MVdESNXWbYEbqZnN1/A0eH2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dl5x+S15kZ6vYt7nryYTScvl3k588A2IG1zj0LDNCZhDre4OHtrWvKy8oTu2DYg4bxHjpshvR34ko7v2or+fpU3ennKYQRODzXHKPvwryvObXBUakiRRPEg3+/OsAWpUzeRktNBgU89n/R80R9nNoCT7FWDxx/+WycR8HZy50EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bum+oGvf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BY0+qr/6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bum+oGvf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BY0+qr/6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842TFQ1447452
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 06:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M/6QQ7WdcwGD8BB+82A2cyO4
	rDmzsYiy2RCh26HWhFU=; b=Bum+oGvflb+UYmubsBaGRYBG9/7xSd6i8R0L/tLD
	hPCBmdLRYqtPDT6AF2aRzX9ZkqInp2cZcP/otnf0ZAdlrrvBUWD7Fm1w0apRLfsL
	A1y6gY/i6sYahiI8TpWwX/YpVrzlBZbJyE4jU2DtajypoJS3BBlpkM7BDaBGlaDm
	A1MUkolRI6O5y2VLT1nT6jrz+HHypcl01sF/v7rOj3eCQN6FcHlxzCExOouIh97K
	ZRYfuroFTYOaUUNbNf81fHKpP8K3XvNso3MSi6+dweK7ECwQfA1/S8sLn/VCbsxz
	5ZrCIDJuY10OVQcLA2Cxa1xp7aUcyPVhPxJYD+7RKrsnNg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u11y7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 06:14:31 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9694e84752eso406796241.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 23:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783491270; x=1784096070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M/6QQ7WdcwGD8BB+82A2cyO4rDmzsYiy2RCh26HWhFU=;
        b=BY0+qr/6E+camQ4Wja1NYGP0FkMQA9PRtAzFFIkRJoM8hgrf2S+p28FwtGkodbhRzd
         7527EIlBbeM3AgQLFFeacCu78qhC1+FPoLZUsfauM9Sv2M3GWI4LgrlQ82RuN83GKkY2
         rFaYyz9vU3WK7C4UjDxWoYPMelvaJygrxBbeoHNFzty5hZdB2N4o+ao1yjBIqXe13Olh
         jn4GR0JpkEEAYGT8tI2K/VIgs8aRt8oZ7EdcNax9518AwjTnrZNcoKsF9BFGx9wVZkDa
         d51wMbwDQlpE6VP7mmzxKQIlZEXaddVAiNzZaSjmKjAFX7uaf46f6INdvsAQ65fGbUje
         lvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783491270; x=1784096070;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/6QQ7WdcwGD8BB+82A2cyO4rDmzsYiy2RCh26HWhFU=;
        b=Xs+peHHb1/DI8iL8d6kNoHt8+7Cf3DnDSXfcYPhoaVL1Bv0GSDPuAkImKw4EBXtQcs
         i07Buz47F2lSRgu0MLadXj9ijOSw3mgf8rsluueGtfaBpdY8erF2Kgyz+8B8409fQSxn
         EM8uAGUbL/bplBMyo2Uir2aP1W0GCBlHT5e16Xm8vhuyshwNN9Sm77FdBsZVKmxe0pLs
         ipZ7F+LnLRhah1dD9uPTEo39xasuYj9yxgF2A/uqI4f2h7iBtoRGRMGrfUZz0CceWEd/
         TtSmM/s5t06AAReQxQWq444fY2AJo+ickZjWRLujcPmVo6t5K8pyQHJBWmJpfNr2oyB2
         Avqg==
X-Forwarded-Encrypted: i=1; AHgh+RrRwlPbRaq/3Xf+e/A2fUtFXNADldkhlfKTullPwzlFt8wl03PyyuT5ezG8VSOZatA/MHOOC4xvvsr7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ovhllPTGqV+SqHTlScEe2NTEdZFbwhtlI5bvO3vFoVTbMcrU
	O4P6T0tESfQrh7jajyUrZCW2Zkpntkn92K4soGDORDZusKsjwPareErlejrmazz7Z3RC/b7+jY3
	fTmaTuwrSi+ghj57/ebcT65/NeqifmMDs0BEj6WkZ3c+D4D+K/kh+b66/Le31ycCY
X-Gm-Gg: AfdE7clFdYjmGaAnc6asXxwzpaFHLkfY6zxnuFhHgDMNrjdKdNrwWZlgDDuolKw4uy2
	RKZqMMQv1l8RcnMWX4STAdqFDbY8FbFTE4u0grldSLN+iXfdX11eAvIYLHtoHJtnChpupLGEBxD
	HIEQzLtmZPjo5O6v8whqc7XlpgMPosFcwDyg+m3Rbk8jy5sWYLR61xxYv0r3mbECp8B07R5dbz2
	362om3CZOH9oU5/031VlSmjKS2aB4IQQfNpW40klAnsUpnwy1vdNlfkWcOFGQ3tiTZs8exUtWEB
	qEcZYTW/1seo+DoWUu4gQaxfzW5//TSET9F3Ee1bvGegFjeLVV16JGGL5S9PMaeoUcs4k9NtdxX
	njijD2XzyKFUv9Gs9UzNMAYR+kSjf8TPI6JqW19VBV0u1EwDPQzsMC7+JeZyHESk5CUp04HvXpR
	yt+letJeItw9skLJema0fpvgBQ
X-Received: by 2002:a05:6102:50a3:b0:62f:3e1d:a55a with SMTP id ada2fe7eead31-744e000e620mr590842137.2.1783491270091;
        Tue, 07 Jul 2026 23:14:30 -0700 (PDT)
X-Received: by 2002:a05:6102:50a3:b0:62f:3e1d:a55a with SMTP id ada2fe7eead31-744e000e620mr590831137.2.1783491269675;
        Tue, 07 Jul 2026 23:14:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm3309301fa.40.2026.07.07.23.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 23:14:28 -0700 (PDT)
Date: Wed, 8 Jul 2026 09:14:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
Message-ID: <5vgaqwib25halm3akr7mnkihrz6nuvbumgd5yxtwhh5t2ahnum@m3idk5o5zxs3>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
 <cwc6a2d4fasizfe54f6yvpgzkczbygjzkcoo4jlnn6tjaw3pei@m3py42bcnooc>
 <a8ea64e6-1808-43d0-86c1-e71d233f7846@oss.qualcomm.com>
 <088fa4b1-1b5f-4991-97b4-9654eab66253@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <088fa4b1-1b5f-4991-97b4-9654eab66253@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4yQcBxMMP2oPrG4ldC-dQ9tlKs3Xo-ti
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1NiBTYWx0ZWRfX9XCKFsD9w+RV
 DY2GGGeU5anMl69yDlNMIQv/e1xSJAAphUOejWMpH++rs6IEvAqUmYofiABPDG41ikLPrnmx1EQ
 Yk91ShC2mOCqygBqugS4a9zOIUDJFzw=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4deac7 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=qGSba57apYWIHMREK9cA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: 4yQcBxMMP2oPrG4ldC-dQ9tlKs3Xo-ti
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1NiBTYWx0ZWRfX1Q0rk5hAxKc/
 ybp74aHnsRNcs1A5PEX328yFmnqI7nREIXw5pAiVgg+NGQFz6uiA0hf0TAfzefjUkkCUlIdRP4z
 OwOKNdw6eu+jYGI9Jx9WqLqF8BOWzJTaEWIjEIqEof9+277WPxZD5ValzxKU9QMKlIxasjEIiKb
 FlQNNZ+fU9mbKeFx465J9ttAHzlaG97X37BFOm9ltwo2z01zZGu2uvoahTw5pstcM0NoUx0CU2w
 xSiMgjXgPL7BdPaa5W97uh+GJEqCYd+i405dA+2scKSEOpNYCVAI/QsctIQtGUX4C1bqRTqcVjU
 DHlGypNOiK3xI2Py/CvTYmxPl2JwONM4fgbWWIp0pG0SjdIEu6NjNvSPvbE0bJUviU5MVjokfjy
 yfN85Oo1RHaHz62DsbTDhgLqWPTBfazRse8e3uQRvuyojnSexx0RvN9IsH3w1jYkfuduEiMDPEs
 Ct/ioGqm1vBZ0LKSo9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080056

On Tue, Jul 07, 2026 at 04:23:03PM -0700, Elson Serrao wrote:
> 
> 
> On 7/6/2026 2:27 AM, Konrad Dybcio wrote:
> > On 7/4/26 2:05 AM, Dmitry Baryshkov wrote:
> >> On Fri, May 01, 2026 at 10:06:27AM -0700, Elson Serrao wrote:
> >>> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
> >>> independent High-Speed UTMI paths, depending on the SoC configuration.
> >>> Each path is distinct, with its own connector/controller connection
> >>> and role-dependent UTMI routing.
> >>>
> >>> Because the EUD sits between the USB connector and the USB controller,
> >>> it must relay role changes across the UTMI path. In device role, the
> >>> EUD inserts its internal hub into the path to enable debug
> >>> functionality. In host role, the path remains directly connected
> >>> between the PHY and the USB controller, bypassing the EUD hub. These
> >>> hardware constraints require per-path role awareness, as UTMI path
> >>> roles may differ.
> >>>
> >>> The existing binding models only a single UTMI path and assumes a
> >>> uniform routing model. While sufficient for simple device-role-only
> >>> configurations, this representation does not accurately describe EUD
> >>> hardware when role switching and/or multiple UTMI paths are involved.
> >>>
> >>> To address this limitation, per-path child nodes are introduced to
> >>> describe individual UTMI paths through the EUD. Each path includes its
> >>> own ports description, allowing controller and connector associations,
> >>> as well as role-aware routing.
> >>>
> >>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> >>> ---
> > 
> > [...]
> > 
> >>> +oneOf:
> >>> +  - required:
> >>> +      - ports
> >>> +  - required:
> >>> +      - eud-path@0
> >>
> >> Do we really need a separate eud-path node? It doesn't represent any
> >> particular part of the EUD device. Can we simply add more ports to the
> >> ports list?
> >>
> >> For example:
> >>
> >> ports {
> >> 	port@0 { endpoint { remote-endpoint = <&usb0_host>; }; };
> >> 	port@1 { endpoint { remote-endpoint = <&connector0; }; };
> >> 	port@2 { endpoint { remote-endpoint = <&usb1_host>; }; };
> >> 	port@3 { endpoint { remote-endpoint = <&connector1; }; };
> >> };
> > 
> > I think this was originally born out of the role switch framework being
> > strongly tied to a single OF node (because the way they're found is via
> > graph traversal and not via a phandle)
> > 
> For additional context, the rationale for the path-based topology was
> previously discussed here:
> 
> https://lore.kernel.org/all/CAO9ioeW7O+arR2VdAZboty_cAdtYm--ppMx9RT3nTQpJbTGccg@mail.gmail.com/

This needs to be explained in the commit message.


-- 
With best wishes
Dmitry
