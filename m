Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAED352032
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 05:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791954215; cv=none; b=gH3S6U5oBWqjMN8XNGdtUgDgMX6A7vQQAdI0OP9vMRkbvyhsNR+vzRgJ0bBj6+kTjhohncYnTQINGYTpG1PgKjForYO5aSuW4UDc1BQ2apY6G7NoxyCSAfrJ8RpavC0YrueK9cySRvymFPz7pJqxfPI7VyD/BNX2sYjZNWR4rH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791954215; c=relaxed/simple;
	bh=ubKoPgXQXHc3GSIxqcIQKnq/O/V4JDb7y8HEE+B3tyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Su+fb4GsA9NrwUPEXcO2m7QViasrb/8moZWCXaW7tqrFDMAAYGm/3/W1iJvDsOAa8xjFQmwloGKLMwanGN4lkCgOL38F8XvKvzOVCkr4AY/R1/u0mjGnex1HtabD5iz0k90LtxUo1Za7PNeA286a3+F3rbWT/pr9EoKECFNpyUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oNcbzuvY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z9TF3+JL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oNcbzuvY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z9TF3+JL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E21sja1592401
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 05:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1habXBoGNYXdPzU08zG+15Pf
	ctcDvaHUapAr9Iz9pzg=; b=oNcbzuvYciqX4x+PQnk8vhSnLik434800wZwzpxX
	DIi0oFu+vlyp+pGIhoIUDrF3XLXpifWO61MIQjOjlFUGzB4gX0V0Uwj/LrOJlJdy
	slpWgE+QdgfnwvyUmm5Kl6fIvljkHjzNnKe3sU4PGSHVj/oxh/9WznT+4anoIJEM
	cqXAv4+HiRdzt15HKvkQEMBbGM+pyFpRkpEcOKWEpe7y/rFTNXqvXpD4yRzTPYJV
	vyb5otPaUewzh3t5D3VmLcMv+V+oU8IONgK99n+eGsqGx2sDluNLJVzGCi2IqXIL
	JVqUxSDnV0z3g9OHJIUQDRZY7myuYPSuhTrR4fLvnrV4JA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s1tjeew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 05:03:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c5aef2a74so2629079eec.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 22:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791954212; x=1792559012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1habXBoGNYXdPzU08zG+15PfctcDvaHUapAr9Iz9pzg=;
        b=Z9TF3+JLBNot+f11vIHn/whUrgC6WeP965g4i44DQ6YD+bpGYE2GUQFwt3DN9OQSEe
         mUpiXZ2YY/kSzKh6BCvX7uAmzYruAx4ViDEw6cuSmN15kAXUV5y4ckoPfNW9jMp4YI2e
         AA8tUUJULXIQHYpwOGT9cUAUChRknYnv0Ef+371NXevPk27s+y8ytsDfn5HMQYs8ORbh
         OAdS58cjnEhlkv/nC5RdkvU0c2bmt1gaAaPKBq+I0pfIiasAI7L2BZarohbwZ1xZ1iQ3
         aa/pTh71ONmN8rTsmo5dk+9cwdBueEFn7uQDdd3721njI38kdm6b5agJsuGUBAbTIyig
         3qOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791954212; x=1792559012;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1habXBoGNYXdPzU08zG+15PfctcDvaHUapAr9Iz9pzg=;
        b=rA4XmkFtejn+3wX3SeSGoGO1Q3rjbGF6azlRVcYAwISKB9ikDy+veLfxlu6wXbl+39
         /Vk0UdjO0++FTcUwCitmlO1VLAMYdQgQoohGBjfO1W4nxxvGg+FRmxKUcM2H/STyTUgR
         5Gk/LLaa6oRrYDmM4HKjZ4GFDcN149csIlt+CfKLvqpHBb4xutvDJM9xDA7MPigE/1Fp
         CxOaNC7m0W5te0PG3kE1/9vOK7wmANxt4qh/6HMfjRBd1IhR4B50y1c601g6nkv3/FtA
         /h008YfeDgCBeO9dHa0tqi/kpvaZ0oH0YKXAarVHE2tD+0AX1GMgEZQbd2/ThIt1dLiH
         MIiw==
X-Forwarded-Encrypted: i=1; AKwUvBylmEkgc/hWsK6lR6DjdtyS+xg/XZS8upPVxQXeokwu5JLCnYShvLJJGTQRZAMGqiqcQ3n7Lp4S6nIG@vger.kernel.org
X-Gm-Message-State: AFq9FYKM3UACaWmqCluOg4FE9OZr7zADm/C3BtxSxRtJcn6KnzAW8CaK
	P8R8ANDYcQUzAxXwAeSkLr+6/AhPQw4ZHBdZlpmMSxayhRd0hXPVZE9mXW0zE03rxJlsEvvb+oj
	wK25fXpmHA3jUUJm04dsn9sJAvCWgZr3OMCO9RGUOqzXniothwEOLqACidszxZiTL
X-Gm-Gg: AYBFou0CJ+5I1F/fiwgfThgYX4mI1RhTTbqI4FdQ9TUfonDPu3fq3c7/dlj6IRlemHb
	1DvxEhwt+fIQYWprTgQAJlofc7U2W919EUJaNiIMuyjRKGtEPBr49EL4Ec1Zju9PVWDOHekwDR5
	0WnuUM9tdWQ89+wiehsvn5Xrj0dTYOuGO/pMLTqlZP8RbVnNXnKW2akNpYbcSEeKDdoXiwpCwhr
	5KaGwBP5KTrqXS7x5tuR3mbNTzNg2bcIIYtkDSm1gUSII/wEujk9we47cxCKq7Eh9PwmttUsKQP
	a5dvkro7idPGFFAop+BQCKEIMzIAiaWsa3iyzHjM9dDoB5SrQdMIMPCuIZkUoYHnPhqtyb2Wk3S
	mpnxkLOvcb1ohvlGiCQtZT9LBoktDvY9S8ihRHhkDwBeSNQJidQOyjH/Urs7sH2DGThwtqn1mHr
	QoTmyu+QAwj0U1RwYZLdHhCkNC+izD
X-Received: by 2002:a05:693c:8215:b0:35c:85fa:5a68 with SMTP id 5a478bee46e88-35c85fa5c4fmr6092256eec.31.1791954211941;
        Tue, 13 Oct 2026 22:03:31 -0700 (PDT)
X-Received: by 2002:a05:693c:8215:b0:35c:85fa:5a68 with SMTP id 5a478bee46e88-35c85fa5c4fmr6092224eec.31.1791954211451;
        Tue, 13 Oct 2026 22:03:31 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353814b556esm54827471eec.18.2026.10.13.22.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 22:03:30 -0700 (PDT)
Date: Wed, 14 Oct 2026 10:33:24 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 06/11] arm64: dts: qcom: ipq5210: Add ICE support to
 SDHCI
Message-ID: <as8NHH4j2SBkDYnC@hu-varada-blr.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-6-77bd3d68d850@oss.qualcomm.com>
 <a7f04052-37d1-452c-8755-013e6e16414b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7f04052-37d1-452c-8755-013e6e16414b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IpOL47/g c=1 sm=1 tr=0 ts=6acf0d25 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Q92GnTf-AHtPrQ-LojcA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAxOSBTYWx0ZWRfX36YqMfUc9yRy
 0uS0Aa7cBFfjo1wjBmh1H7mOoTE/VvgCoEwpeCfde5cEQnz0uFFDjujDgyt1AjAGuEII2Xcj9Fk
 pvaIPVarYq4YttCycol17Dea9Yc6s24PFOUoVhjwsgb1y7+HIlDPu7IxD9eRx8fBc18i3g1nBYL
 ptutcJI/0TVCzMKC0ijDjW9F2F49swUnE5RFy/JsZ5U4a8CkE4BJZD08Vl8Bu0qIwDSYkpbwlWL
 Zu5H0FJfDXZXiV7oKlR2R7QtxxKzIobCK554lDi8Jr+6GZL7Y6WE5TU0MDnIB4DVWv3P/LjrYHO
 TiNyMtSWmwL4Qu5spAk67XXXVYQqqxADyyNzFRB5iNiGvkT47i6q0P4rrhG7FhzxoEEjVhy509z
 dkid1LmUIfjOpy8FKw2zRaz3qF6cvXpSnrD5ieTeT4rKgb2jqHeYvtQLLhDb/qx0m3T8NxnZm4O
 VwILBS/upHoe83I1/LQ==
X-Proofpoint-ORIG-GUID: hWi3pAx8v9ovzYAQAckPk_6B7z1OFfaY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAxOSBTYWx0ZWRfX4xZ9cB2SO45b
 NScNsTJi5o5xhWyIykv4iDKJ/MVEvtt5MGBPPga5gSxFovQ47SW8oo33MML+ASaHgX7W0CBGXNf
 W5V0Ld2lveqw6QejzrClrbImw2zyJk0=
X-Proofpoint-GUID: hWi3pAx8v9ovzYAQAckPk_6B7z1OFfaY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140019

On Tue, Oct 13, 2026 at 04:43:36PM +0200, Konrad Dybcio wrote:
> On 10/12/26 9:23 AM, Varadarajan Narayanan wrote:
> > Describe the SDHCI ICE register region and clock, and enable CQE support
> > for the IPQ5210 SDHCI controller.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/ipq5210.dtsi | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> > index d28d68a10958..c14b42c22616 100644
> > --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> > @@ -416,9 +416,11 @@ uart1: serial@1a84000 {
> >  		sdhc: mmc@7804000 {
> >  			compatible = "qcom,ipq5210-sdhci", "qcom,sdhci-msm-v5";
> >  			reg = <0x0 0x07804000 0x0 0x1000>,
> > -			      <0x0 0x07805000 0x0 0x1000>;
> > +			      <0x0 0x07805000 0x0 0x1000>,
> > +			      <0x0 0x07808000 0x0 0x2000>;
> >  			reg-names = "hc",
> > -				    "cqhci";
> > +				    "cqhci",
> > +				    "ice";
>
> This should be a separate node, like on other SoCs to allow things
> like frequency scaling

Not sure I understand the comment correctly. I checked agatti, sdm630,
sdm670, sm6350, talos DT files and they have added the ICE region similar
to this.

Can you please suggest an example, will follow that.

Thanks
Varada
