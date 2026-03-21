Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548322BE05E
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 07:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774076556; cv=none; b=X175SHw/Ytd0jW8AEmJEOFWeFJZBHrnTBxjRZA8lEiOFZTDdbk7rcEvmgfMg1LD/+K82OiT57zuqVYzZ+kMA3HFt2KMw3wm2fjO32aZPTmQ08q4UQ78bn8kpwihwn/x+3OF03bgA5NtHJ02nwWV39B41fVveaJJ2BA62bBORRQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774076556; c=relaxed/simple;
	bh=orA7Kl2kyJJ+DwbqeM/sTgHWJlKWLtVGl9tfYIHIIc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfVA3MjYhPg1hW+QeOd2y6Q76Vq4VbHj5zbif+/DIaGe3XrZupO24xhDQ6Q4RQ5TzWRAJf+BtE9kfTpPCzwV92ovVfyvRXhhFPZZMLQvCvP7nyRmai+OlkPuCKyADIjIq+vcYlD6ifaZX8p5902rGZdqBVCxefcEa+gV8LVbKoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lun4kW2x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LaQ/2Ykg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lun4kW2x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LaQ/2Ykg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L3jWTt354782
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 07:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U2nL8wjs1/k1fQh6HkDKZxrP
	2ZPVK54z09kYBPEcoeA=; b=Lun4kW2xfYHpFg86F9Lhh0MmfqSZxXaWLpXM9t2f
	RYRuxYkgd7QjcB9qCMgViL8KU6af/Iqwz6e3hnQ37JPlZSVDuEy3amC8SZZYBp8K
	LmDzIr6g9/8+/uIlAadD5AIo91XLlq6esIULV91X2+aDHox81q++XwNs7U+GRYWv
	Ybs9vs1VHFpasNVREm0g67E68/K38Bs3XjgVPyLnctpXDIUfYLAgfIHUAejxlzvl
	wa1+VJBGx2A2+WSRwMFI/KOVe2HBvJ6oY99b03GiBxTa1bCem0CjGX89gS+hHQJ9
	Wr9ptuNVSSp0o8nYG/4nte/M5Utxd7HOyvFLXb4Ip7f7/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kq5r7t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 07:02:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50937cf66b5so185448681cf.3
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 00:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774076553; x=1774681353; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U2nL8wjs1/k1fQh6HkDKZxrP2ZPVK54z09kYBPEcoeA=;
        b=LaQ/2YkgSkImz+LaOCkrzLT45IadnFRWbwQGvslu8r0hewtcf2Yg8vjGtc3D/vJcsn
         BsTw5Qo35yJzFUBDOtg3m142dGEAJkxrT5CKBeXR3DW8GmDFf3LCDZW94d1jWl1ASQt/
         1SwbQPZW2aT3okOno7JKpXw1Uhz9QdNj89nwY8F77SGKTmiLOPQ8Kt5b7GHEYVpyItUe
         kiQO4jvZOj0iPQwHF2i9DNZky7oXn9NCilFLf7jtWfwLdH6EDbuEsId3lOfpfiu2TJtV
         Zl1BcdosuiKGnWaSvstJp97YGFrYnoVGTghnjRqsTqvF8aQLfCcHDA4hnRDboHWTcR+H
         xlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774076553; x=1774681353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2nL8wjs1/k1fQh6HkDKZxrP2ZPVK54z09kYBPEcoeA=;
        b=q9aObg6wUMepfVbCXgq3WHF3loEJfc29RWw99RyZWDWcEyb+TjEZTdEFgbja4iwCrX
         hMRoftG/fLGvTTsZZw2JnOvdW60New8FxwNjJhQpvhP2gWahL14jij+OnigIeIPzJYf7
         0Bgv3DANmpbICdIyZyXNHx+7g9hYwMMrZe+bp30ON/SvVlcfwuEvm9KVZKxFD+J5IpYo
         NbV1b80fII06qQn/dtZ0NFEk5NkdfJZAe42SOV6SJUIGV46PuKk42FWsK9xucMGuN3Cj
         Vjol9IdPTxEL/eKXkoILnnqh9cbF+gGotnL3ivd1TzH+H50BJA/wThHVSyb4TLs5/2iR
         O1Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUd3bJifJ+2pyC/VlHJ8tDTiecRv7VNAhLP2ZmTv4NwEBUxWG/5xyzCZVQdB8oz1eWxeo2ee4lhcwm0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv6U0BLR/o8s+snlBoPPnt1jihP7F8l/19TAbc1iCXkUAQR33K
	bNfp3XNKbHbMxAkEgEKLn8ZAmZHJ8XTaFkiVKTVzeGo3MaTkC0nalLQTjHQMVJSkRX/ylvcXwaV
	hkZCqrCGIZAw8IevQEqpRGBitW7bSMKdl5n2m//vqOxch5U0tavzXny4BJGPw4xZ7
X-Gm-Gg: ATEYQzzV4PIWFvqy5Hvl4jpyx430TrtnagSFAkoC1X/6rNeZPX+/tblKLg1Gppy8xsM
	ZnGbFx5cJvvbDDOqrE3WZQ7VAAlgH1OwM12JEIWBj2PjJANYjIL2aQ0h4k/KG/ONNS8+VgnWKNM
	ndBYpPGiuuynbVtgKskE0uLPZjHO+u1dbmkJ73+EaqIJW2wpo0sLxo6xMiOtzh6VUvQVhumA//9
	C9XLERU4hlgDm+ncuUMGh+Lmhwvo7bOwweRyA5BgHuqZyVDnuXGq0SyNFqP8iFYC3+nUgpZT349
	g8XL1i3AqLXEIHCnoIJRrzf55lnH5/i8Oyj3G4xakGa14gTSpdga6c3qranZnXmd4tBqjRcW4WT
	dmnbk3G85ke7to57bAGUxfcbuZllKlplOBSkzYyXifiYMQrlL/a5/GkgBBLzSa0AEgKxDxCT9Eb
	xWNlZXbotbH1K6ZqwHGG4ht0y4Z/jtuS/kjCA=
X-Received: by 2002:a05:622a:cc:b0:50b:4ad3:a32f with SMTP id d75a77b69052e-50b4ad3d375mr12596711cf.61.1774076552720;
        Sat, 21 Mar 2026 00:02:32 -0700 (PDT)
X-Received: by 2002:a05:622a:cc:b0:50b:4ad3:a32f with SMTP id d75a77b69052e-50b4ad3d375mr12596451cf.61.1774076552334;
        Sat, 21 Mar 2026 00:02:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf972bbaasm9003671fa.6.2026.03.21.00.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 00:02:31 -0700 (PDT)
Date: Sat, 21 Mar 2026 09:02:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dylan Van Assche <me@dylanvanassche.be>, linux-arm-msm@vger.kernel.org,
        Petr Hodina <phodina@protonmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Alexander Martinz <amartinz@shiftphones.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable
 TFA9890 codec
Message-ID: <iallp4dnslfc6udkgqdgnvv635aa3eeq4hexyftljienfxssjh@mjfnc7dhtrti>
References: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
 <20260320-axolotl-misc-p1-v1-3-89c9b5ecb26e@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-axolotl-misc-p1-v1-3-89c9b5ecb26e@ixit.cz>
X-Authority-Analysis: v=2.4 cv=GNoF0+NK c=1 sm=1 tr=0 ts=69be4289 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=7Ovdx5uLAAAA:8
 a=EUspDBNiAAAA:8 a=Fl_3bDCzLZ1VHmBS2HcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TQZWkJv5rNK5-PaLMsrg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDA1NSBTYWx0ZWRfX4fQxa9o2r96a
 b+fXE/PjQmv6Kmm9S35FhrO0JNithnEVB0qub78lDdWmaJtFkkERLVmFQd5iZmttxYoFI39Ib8g
 oVxfRZaYC068WMqJlAjrLN26WzDQjF1LZskY8eJX/MQhJsQe4bGNGShvj04wkElu3orNzsqhKAh
 U1ooZhhn+jlA/LG9QpSpVLOc+bYViHtzS31pJqNPDvsbnvPGTIQnOR59m2jbwFlBfnGzmNgyQ7C
 1gChJRaFd4fCw7SZLGSpNlERiCiBBmMUMQp6WgVqy4UUrp2XBWFFLMlOe9leoCzBoKlNjGEfmux
 oSTVI5cWh2WycXNWyxkdxPn8aTTSRS0GR4VbavX2cFoMB5BA/gxSlLtVurmMEfj1n8ffkcmXtae
 GBSJxV/9H8/ZFENvc1quWNw78s+q3DYuyLQ55Mq4o8hdJzK6/YY8abrlkJYvOqc3yRqoVZNqfsl
 u2tH+aScXiQwQbCwonw==
X-Proofpoint-ORIG-GUID: yVz6oAAc4zCFgYRI1TuLPKv7fyJ9gTiD
X-Proofpoint-GUID: yVz6oAAc4zCFgYRI1TuLPKv7fyJ9gTiD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603210055

On Fri, Mar 20, 2026 at 05:29:07PM +0100, David Heidelberg via B4 Relay wrote:
> From: Alexander Martinz <amartinz@shiftphones.com>
> 
> Audio amplifier TFA9890 is present on the board.
> 
> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
