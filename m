Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C173D5C1E
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 12:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217625; cv=pass; b=U0fIg99ga2ElenKU3AEwvqz6ZubOFWlOFkFfK1F2btDD1M4t8kvP8ie3M75JVOHAeIYAQa3HiGuZusg7KilBNnwu/HTZ+4Wpnid489RA3ZpP3Dvsh6EiGHS9cQTA9HmFP1SHQdM8/sfhsfjJp/v4aSiDwfMo5H4LwZeEz0UBFAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217625; c=relaxed/simple;
	bh=7/LQftETyHGWgSX2G2vHM1wJ41vU8thaiCw48xx224w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ASSwLfuhXlzhKeEQIjNOMn1Ql3JFMZgyY1pjTRz6egKkoB7pC3bqkNjjgmC5t7UuAWbyzG+9MpXwZXYxDq3+kzGq+YCfTyzOdsclbh2ApBk8NoGrz9rdjjpvzZedllhISrk41zMAHs6TdJl8Tj62KuCk8t98gG9RNKYkdq0HkRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jg/S0uHk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UEi+eZMy; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jg/S0uHk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UEi+eZMy"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXV1P3744709
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 12:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Peilm5GMknF7DoalP2gFZmK7h0tb+Y4svc63egvx14=; b=Jg/S0uHkeM4A8Q90
	CfDNCsuglEQ2J0vvSLvckFNA+8l+EovNT0g/fuF+KeO0wvAULR8Vn9kNDfCZV+p/
	5Q8ZX1rztepZWg3o0Ooq7uumfRq9uPW8YuaqDauT7eRKfiFyMh+B32VAWX22C4MM
	1m9MGJ+aQl2N+Z3fLQxhkhjPyBVEIUuzF1k/eZgIrBkBgt4nCxtqNh41fAsd+h7o
	qqnOtUGpz4rtoj95J0piBAHb6LGr4mAk/YfZ8FnLXxHifiy2iaWyTG5lXjrUp0nX
	puv4ItQFtCW+mn/n/ehgezFpSdSzxlbVbS3azgvnywNFYI9EG6QBYR+yRhrtMUfv
	yJWTGg==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eypx38vsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 12:27:03 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-662bf0ea6b3so8073085d50.2
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 05:27:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782217623; cv=none;
        d=google.com; s=arc-20240605;
        b=cNrCIrJ/9M8iP5rejcZrnIdjSg49/U04F4nPMEFf3Clcvi2+eIEvF2any8VSQn0DZn
         dtm9xbV0El05zUQXi+2prYlnNy8ag8Ee6BwWFD3pNMwiVM6Lq5b2GFoyWUKvWi6cTo7Q
         C9vx0ZLupJzEwInN5duBExcDaBu5ZgWZ0l/cr0cF6JfQI1vm72/5eZ2HnUkmTVZn1Ad9
         2qhVIBijaA4CF5GLpvy8WJ/bzgZCsxNH3pU4uwM/e1Hm3PvOnZbKPCDGW3tiruVk19az
         1oG0ePo4EO+ULYnq0xF8UOldbxQU1rswCEu6gJ5RCjuNak4QutnflrghDXQ571erf6JV
         SwaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Peilm5GMknF7DoalP2gFZmK7h0tb+Y4svc63egvx14=;
        fh=w1YuOuUnd+Sk2lt59S1x7WUnLzIRIrkSMzHIe/w2oYw=;
        b=apU+9sGBGhlsYBO35dVPd8q8KoAshV6QgvB2mYuKN0wFgxWHWXxN/+4Lns1EIBbg9p
         0hFfbT4/ldIOSTjFwFtDv6hlgrsW5BosHNS0KCdz+YR9p/Q1oOeGwEPxrxTzuB1MmsVz
         ojvcLdx32dF80A+KisEc8YVfoM7wUZfbDcCyde/bLwYATeqWTXxBWQdmbE/vSgCXw6Cn
         mFSqteNU/0RqUS5ncFC/4+pJKf3JlBghaJ7EzO+h5b7Z3eCO+mi1zF2pJ77SJSF5c6aK
         KwU+5LiLmgleuRcHlujrV7oDb+RRWI5Fnxoep4OQzL2yCwiudhSYNN27Ba3sAk9j0MHk
         eGWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217623; x=1782822423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Peilm5GMknF7DoalP2gFZmK7h0tb+Y4svc63egvx14=;
        b=UEi+eZMyIKVHYgKb42Fg3hgj33nMuvi5ceyZpZi+b5jqwMr5f3wmZqEoj88AA5XSjG
         RHq0dDwj4kRCQ7jXUTG1NVLTJyIQ47ivmqbFwhBN28qzHhU1rGBqowh99HI9fp5dqEyi
         huBtJKBKlNYE6XBnwf5cUvaGhDrBVWVXo7QiNol8YhBkdiIRg3rCNj6OdSD3Nb6+yBLl
         LcbD2v1OgG03Mz4d9RIBXAgoo2fVA2nuX5nzSSa6I+3MBu9fvO9n3tH1Pk9LS5pvXfgd
         57/EEA+fqwNG/QCx8x7ZCFVOrnUC2uxbG4fz44qI/491Fa0WgwTs0+ZSMe8WjLrFNr/I
         EYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217623; x=1782822423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Peilm5GMknF7DoalP2gFZmK7h0tb+Y4svc63egvx14=;
        b=Yc67PW0xJp8t3uinRVGXULxq7lnEvlT++hZpmq+lwp0B+x2XaHhLhMWFOrtOlZ87em
         3HaTQMRE7pIIL/PxJ7fRwQ85CeLfJnfF4k7ysOeiz4WqmAgelxlpGh9CYVLtTNktVgKh
         yGXuOlN81YbVVoiUuiEZDFzMneLlhK16sWpD7NI/c8BcIG1sa6i7h5vfLeaUoVeClvUT
         nZ47PrhLfrZkF1sgYVwVEKKcJ5p1+5/DP/0oFaM3HB1vKexaF3r7ch9mM2UbZQn2/rWd
         FqehQTLa6fdiaMzIyJpRJ5oxb0a75qmdNICn3483Oe2s4I7U1CZ2KwRZ0+m5JO3LIP7D
         ywlg==
X-Forwarded-Encrypted: i=1; AHgh+RonfPt8Oib//Fa4gWmOpuhUf9IrnqBKqQQ3fnkM5009Qh9iKzI6xGbwPCdHo+e4HZz3H3I7wrXVaiNh@vger.kernel.org
X-Gm-Message-State: AOJu0YxXjT6z6MyN790wCM1DNTCh4xJT4nKaKVOzFknU72wQz6Fmk7sg
	/gnUQvF4b5RyN+zDY7BjRA5jGyUEu97XzYAPWuX92Y4KgEUZ1OT8wBJlSzApbqe/XItpTwcwutj
	nAhJs3HtIIUlv73awxZuy4XDyXH301kHNHbrA8PXrCEbWOHnNyLSNtJMXIHhdzBClHFm2E+d4zV
	vJrkTozPcGgHC4RmPfNtosyxtPaEQuphh9mnfsuBM=
X-Gm-Gg: AfdE7cnv06OjRJc67XiZa1QE2ACAvQ5Io+ZYJBPIHl6c8Kp9iUMv12+aazkXSCUh7DW
	DV58qr6bGF7qwIbeXLAHPM5pvIpedfBVmouSqstsxJz+ysPrTyHm38ydDUA03w8Wsbe5Nh6G9Tj
	VAE8b55Gshio72TD7cebaoF6YeTfZ2Q25AfX1ckJB0i2MQ+Ls/C0O4PdY6ROvQQ3HMT5jj
X-Received: by 2002:a05:690c:6e12:b0:7b2:1bf1:8016 with SMTP id 00721157ae682-80263fc80a0mr166248737b3.2.1782217622761;
        Tue, 23 Jun 2026 05:27:02 -0700 (PDT)
X-Received: by 2002:a05:690c:6e12:b0:7b2:1bf1:8016 with SMTP id
 00721157ae682-80263fc80a0mr166248317b3.2.1782217622215; Tue, 23 Jun 2026
 05:27:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com> <3da8b668-1504-450e-bde2-b383d63090a8@oss.qualcomm.com>
In-Reply-To: <3da8b668-1504-450e-bde2-b383d63090a8@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:56:50 +0530
X-Gm-Features: AVVi8CdEV3C9R692WZmwmWxoqEuJ-cpwwBH_4E0rGJUcM6b62Io0cU-8ZJp4vNc
Message-ID: <CAC-tS8CuhED2dvne=cuTBUcrL93WXPjNB-nDUYHWNtFF9oVVjQ@mail.gmail.com>
Subject: Re: [PATCH 2/13] dt-bindings: sound: Add Qualcomm QAIF binding
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=EsfiaycA c=1 sm=1 tr=0 ts=6a3a7b97 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=Jg4MX6P3rhpUa4gzTSMA:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-ORIG-GUID: hDf-GiGV8pFovkqkXC-vtwXo57ce6jhd
X-Proofpoint-GUID: hDf-GiGV8pFovkqkXC-vtwXo57ce6jhd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfXxtU30/IsNGNw
 Bx9iJEIUyMlw6oqfKG0H4oH/1Mk2wrSQnnlzuBKlE8Ka+b8Dl07ZMedEyY54ALHQ2WdYZ897yBq
 5E8jdj7YjXukpp05MdvC2AI9LqbTOns=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX0AVwRqxsLcOo
 VUd5TC2qum2G91BmAr1RMxNgmM7LHoouw308pnvAVvdyamdNQzsliJh1750NzSl2LYtPVqNF41e
 V/JHd38RGKbaPXef1OM8TFxm9rF+HNWWayK5bJXaX15aXFV01onVSkC1zmHAoQZBMjy4XMquCPl
 CCivH/RN1Plr7CfinFYyyoFU8Fqy28+B9ahFK3BaMlRsPQ4SZHke8ctfyrarMVNN2qaCl5GOGc0
 RVZ9B9dDPlsm3wQxZIMzrriYJD/VvDXF/XgfDn5OIEvZ5uBKHW0MqYBC6xBAVF7aLtuooiwdddz
 Mic3h/0mKRfCKob8jLIUq0DAbKrqaOC6aqyGE9mCWuXMYwwmtG1VVRazqjccp8iAjxUm6X6ZZep
 ax9jqN9gObnXi+rvrFhUEDLYYJcB+LJGmQ/Ty5Q4EbvO/8hKiBDbIUMhBuqiF5Oh+O3K334ybUz
 cvBY7+bG1Eqn9oO+K7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230101

On Tue, Jun 9, 2026 at 3:27=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/5/26 12:37 PM, Harendra Gautam wrote:
> > Add a Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DA=
I
> > controller used on the Shikra audio platform.
> >
> > QAIF moves PCM data between system memory and external serial audio
> > interfaces through the AIF path, and between memory and the internal Bo=
lero
> > digital codec through the CIF path. The controller needs a binding so
> > platform Devicetree files can describe its MMIO region, DMA IOMMU strea=
m,
> > clocks, interrupt, DAI cells and per-interface AIF configuration.
> >
> > Describe the single register region, one EE interrupt, the required GCC
> > LPASS and audio core clocks, the DMA IOMMU mapping, and 'aif-interface@=
N'
> > child nodes used for static PCM, TDM or MI2S configuration.
> >
> > Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> > ---
>
> [...]
>
> > +  clock-names:
> > +    items:
> > +      - const: lpass_config_clk
> > +      - const: lpass_core_axim_clk
> > +      - const: aud_dma_clk
> > +      - const: aud_dma_mem_clk
> > +      - const: bus_clk
> > +      - const: aif_if0_ebit_clk
> > +      - const: aif_if0_ibit_clk
> > +      - const: aif_if1_ebit_clk
> > +      - const: aif_if1_ibit_clk
> > +      - const: aif_if2_ebit_clk
> > +      - const: aif_if2_ibit_clk
> > +      - const: aif_if3_ebit_clk
> > +      - const: aif_if3_ibit_clk
> > +      - const: ext_mclka_clk
> > +      - const: ext_mclkb_clk
>
> Drop the _clk suffix, we already know they are clocks, as they are
> listed under the clocks property
Okay, will correct.
>
> [...]
>
> > +      qcom,qaif-aif-sync-mode:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          Sync mode. Use QAIF_AIF_SYNC_MODE_SHORT (0) for short (pulse=
)
> > +          sync or QAIF_AIF_SYNC_MODE_LONG (1) for long (level) sync.
> > +      qcom,qaif-aif-sync-src:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          Sync source. Use QAIF_AIF_SYNC_SRC_SLAVE (0) for slave mode
> > +          or QAIF_AIF_SYNC_SRC_MASTER (1) for master mode.
>
> Should these be boolean flags then?
It should not be, the intention is to define explicitly, for better
readability I can rename these flags as EXTERNAL/INTERNAL, Please
suggest.
>
> [...]
>
> > +        #sound-dai-cells =3D <1>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +        interrupts =3D <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
> > +        status =3D "okay";
>
> status is "okay" by default if unspecified
Okay, Will remove it.
>
> Konrad
