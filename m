Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793168277;
	b=UxcgTGUmuA83yd+Y4CzEMNy6LE6PBeVqX4t6M4vwO3tELIbUDyGyqgn6r2/EiqihS9GX
	 wRnNgoCkLgJb6AwU33GZShLQfc0dfyR6UTCcoItWO73V2a4x+r0f6jQji/AwxCNmfmuiL
	 Es42tKzwX6YWtF7CapBODwAMswgwAsFcAFDHQkHj7eiUyc+Bbc+mUKsnklLjI5Xh0Wt1u
	 VnHPDEFnMh87/rFNk1ImE0LNXnLAwj/9RLsa3zqzOpo0TkHmEt6u9WPg+wEYDNT/erKWK
	 MHftwrxpf+gpyhXYRVhgUsFzfBqqLyfSwcwA8DceRzZO1EruN12S0SjA+34Vyvh1Biw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793168277;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K5N0tp6NIiHbYJA78yp8UEG2k3L5MK6OnFuRMDqwAEI=;
	b=zREOjUTxnGvVRoVLL4O+0Ju21k6WHAy0vNMDudI5FreHFGzpLRDn7TD3a7GtirROXWrg
	 kQCFUhGhPGF2TFkg6HGZ25RcxFwfkToJpa1Sr9Bf3oszyO1rseLOjGWYcLlO0D4JrrgKw
	 7uPVzHreutWZt3f7GkbZLS1d8AN2fVdZEPWKxgrDW58V3gZ5z2HXHa3n5XHNCNMzvpOUE
	 LXGHvXFnIAbnPbqruk1wRcCt4aqXNNFORHDjRO/oK/j7xTVwAdyF4EjRJFq5E85S3UWms
	 Ova3/1MkMOPMA354K/cOWJLA5dKW7OKR+QE1/alpcEZijB2m1G402wdq4TLtTuaELoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XW2U6fPE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pkn6fGjO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA68606A31D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 06:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDA68606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XW2U6fPE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pkn6fGjO
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PSZ71155491
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 06:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K5N0tp6NIiHbYJA78yp8UEG2
	k3L5MK6OnFuRMDqwAEI=; b=XW2U6fPE6C4yHQ2co7/P93VyMQJKxwrPo2T4NQ3q
	oTvpJ8ah+XpqWFUebYTjh/EPdByKg7ZP0WGr973GUIT2m8ZdKa//XBm8EUSTid/D
	avgTP1xxBrhGwAnXxyjlnwnPy/L05el8TPmxSsDllxIn0C7Pj7m9KkeXmbpY5On8
	KmXD3pwRJr5LrnxAjD3ERtYU2UD6tm4SsIrLHJn0GtwTLzj2uZL0zug64wC+ZTrX
	8kdRoyH/bs0OYLNtBcanKnRmuboxpVDlntnaaDBps0WeWHdzGRgalsFuLKHs1BR0
	EP/341ip8E90ZJwhBQtnHeqsz0m07uT/hdMSm7BP3d2smA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12pt6wc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 06:17:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso489240a91.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 23:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793168276; x=1793773076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K5N0tp6NIiHbYJA78yp8UEG2k3L5MK6OnFuRMDqwAEI=;
        b=Pkn6fGjOKaojX9Ee4XrKIdKcpiAAcrLLsoeIbkiPKQbK9/sbhvYHAMEtaAgoLo7uBu
         L7ka3CU1oOtWEPHnRdr9lkuAN/+by1A/fWnujSoM63scTNDPMK97dNLXjWooXHxQfwGM
         9JxIoVmeAFh4u+pL4V6dzvHicmBMlSeOLLHWWXW90+1Uw5wdzSc5km5XGBbYE6awUZHo
         c2EOz87OoqVATacIcA5d0B3NknSYrG8pdIeT9zkQvmgwGgJopKIk1OTr3P4G8kwhtFw0
         A/3G9X0jKhiMJavfM0p+JY3f+DVIkgL70zN6iCM+GhMeVGDJ+ryC/dfj9LvKJgXDubZA
         /KSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793168276; x=1793773076;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5N0tp6NIiHbYJA78yp8UEG2k3L5MK6OnFuRMDqwAEI=;
        b=l8HjiezZ94mh+fTN6D5QDe5slnAGzTaywcEB5pnudTf3NU/iOKKGg24ydLex5/kyai
         gdkaG5Nw0tqA2j/CqGaLTrTXWtftKuBb3MM4UOMY4lIv0mSVKW19d71DyZRz6/QxF9Jj
         P2pOsoREAW7Z6GqtfjFLvgtUptuC3xjPy4k4Ij+IwsdG6a1Hg7TroLJbp7MSW0GusIhY
         HvEqcSmvFqBnxUS0nt3Z3caDZDVSkMz0MA0TvwjS6Oiq5WK/mWVuXjsykWw4d1eXsYb9
         CA3b7AiEHmbacwrxhOzGlRAVeio+Va0DxsP+ODAhF9PZGl3i2kwXavmz/wzae4pMavGa
         3qgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEtu0jdPiyqGefR7ZHe9eTd500K+3X/nN4s086Mn54qB6uF51IwXl9VVaxx/F4js8eUiS1W+c8xnE9@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9Su/iBrNmpL2ss8r67CETwbrW0rKMT5MHJUZja8/ne9UTps2p
	hW6Nu0aXfxhXofh54lzNuvGUgI15DFJf37pqPPFU2gcmallU3cNNkq4Y4El32GAvbJSG1Ih5zU5
	6s81/fcudm40qSx+NlDQhUM6IhSrITrfJ2ezq300h8s5GBzX8F25OH8Q6J52ZLI7g
X-Gm-Gg: AYBFou2vFyZJuZqOWQv9+zXPwZZfOUz1/G+/P+LziJbKpQm2B6ZGQRfTkjxmbTtjbIu
	x8wlJID17MjAvcBYo2G8RnXSa6YSDepNeFB594tGS/jzCW1qJCm4feGZSiV5164lDs5k0BnHdoe
	RG86TGsU3oKgXAnpC8r3LyGmvuE1WdB4SfL5M2akBQybdWiQt9JKkURJq1L6nvaS4P5VLPqJf1q
	R1SC1QYkzDEtVV7mJmKfg+mmh+GfQa14kVNxSpcjn5pW81Imer/vvbzNReuaFhJuuTSYN+mGfS0
	iWtuLd1AaWa984i6CTciZT/lS434Ll0UTFRGpux4zJfJ0ZXsuCb3q2B4PrsVoVb7jEdpdpx7OUE
	lWeLXiXgsgh0s+sSZ0Gj8p/tr580BbSnrUcm9maMI0Wb7hNg1Mdt1/iCGoLhmdT2H9Pp1BfxpNS
	ueYY5x
X-Received: by 2002:a17:90b:51cf:b0:3aa:f2c4:12ea with SMTP id 98e67ed59e1d1-3ae57f627aamr979119a91.20.1793168275438;
        Tue, 27 Oct 2026 23:17:55 -0700 (PDT)
X-Received: by 2002:a17:90b:51cf:b0:3aa:f2c4:12ea with SMTP id 98e67ed59e1d1-3ae57f627aamr979099a91.20.1793168274988;
        Tue, 27 Oct 2026 23:17:54 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a944acasm1441431a91.7.2026.10.27.23.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 23:17:54 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:47:47 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Subject: Re: [PATCH 2/6] arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697
 panel overlay
Message-ID: <auGTi2SWAeT8fg/Y@hu-anantiwa-hyd.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-2-585caa39cd7c@oss.qualcomm.com>
 <af0cf1d5-3b0e-4534-8a85-e373834e2f0d@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af0cf1d5-3b0e-4534-8a85-e373834e2f0d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: gOn__PTslQRzOcKNKu5QrHuNHDHofGKo
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae19394 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=YnGuxi4p6G6sd6deudQA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyNCBTYWx0ZWRfX17+a/+VIWX2h
 wJWNbR8uRke2gBqKioetTHXGvtjTKZhULVjftjl6cYxWPJjUMjVaLrAr/LYjwCZagSL9yo+rVwF
 WzgJVZHNYr8tnYogVGlWR2z4wGfx66cTaKkHvXwcwkbMw96MuaOy5TZAtgmLC83S3gUCbD6CdcM
 Ib7ychZo9ISEZi/Ae+IYLqv5SOOkc7DR6UBk8Yo8GPd52JZBY2ctBQtkckkWoRm6+UVAPeRP/JL
 ohTZ21T6xfinBIFRCV1rTwPMFFU9ujHob/WdFDNJBf5U7cpkQd2TjieOZjspfNmULa/eLM2EzJr
 bpZqIHHdEc9bZEwXLgQMnqokAc7PpoEtbyMLapNRi3SIOMckk5HYEcwnpmW+iikTTZjkCA9+Xd1
 89tMvpGeGNedkmKErb6Jdccn/mo2h2dulzikdQ5gKBUNeO2upm/k2ikgmNb19W6v+ygqN5yVsNT
 mFEHt3966ddms2QGNMA==
X-Proofpoint-GUID: gOn__PTslQRzOcKNKu5QrHuNHDHofGKo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyNCBTYWx0ZWRfX11O6tB96n9MR
 xhm+tEp8CePUi4w9iyxYJMr9Q9lkJwGcO4Va/W5z7cCua7eIjTk21L7e59DCJwWGJhiSeQCQ8Bx
 DJY9UrApQuHMNuY8olhj3FgwHGTC064=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280024

On Thu, Oct 22, 2026 at 10:06:09AM +0200, Konrad Dybcio wrote:
> On 10/21/26 5:17 PM, anand.tiwari@oss.qualcomm.com wrote:
> > From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > 
> > Add a DT overlay for Talos Lyra EVK, to enable DLC0697 panel when
> > DLC daughter card connected to DSI0_B2B on carrier card.
> 
> [...]
> 
> > +&{/} {
> > +	backlight: backlight {
> > +		compatible = "gpio-backlight";
> > +		gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
> > +		default-on;
> 
> This is a little strange, doesn't it come on as the panel unblanks?
>

I verified by removing default-on and it is working. we will handle 
it in next revision
 
> Otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
