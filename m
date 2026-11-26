Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687273;
	b=h19WpxspGAVICXImv+XG4xU/ALPAbXRKxC0za+pi7Xj/0XtPUyc15Aaluh1lXYWLkr0r
	 WWMm2SPRfYPRSWfnqu5pjjQQtJYytcaH09mOjYjsoEz6PjwqcjzjCbDycjB2WnHr0KIcz
	 PgaDwui2Da4wuJPRbJdPK+/8gSLhq9RfmayLw2Lm4WMuVClMD9pVjZnnkCjPk7M8Hm+qy
	 pTQF3VYkfPn7FDpGvivmmihOhcY1hh5j0mYBORxMEC5mgo3/UU9wiUwyaT5yg0T0lU/d1
	 5lTOkBMmvWk56hGjV/pKtMmBBqGsTcG+G9bO0fgY+ohVC788k2bNupSpn++Li3yvzeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687273;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=G9iILtelhr8Yu2FohoGwzQk0gRPwQeEBjlv06/YSbwE=;
	b=abNpdqYQgkIA0RZYg+vrhpAyIUYwrq/czNuhdO0EGiDHcKrpHCmq3r3DnoV2DOMBc/aa
	 tJWXpenGvV0hnfrbcdOYAF+BT4iJR14KN4ApzX8RK5e6RrfqlPnwMJhAkIr00ICyGU2RZ
	 YHBpVvQEveasMLv9TH3pj7P0Ak7zXkSviQFYYUUagkh5WBBVfrzXk4hZgUC9WOBsNuAtc
	 KJJyP6bJ/gojpk48bAquGBenuoWXDYONh8sE1tI0UOnhCxpA07XdSwtmzjPQNAOvV/2IZ
	 WKBeHRy3+SM7u4m99SQG/2+Tp4Lzp4PbcQUjjG3sItUEzshipuih4NzQit5PrSTgV6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aB1XSrRG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dDOrD4BC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7174606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7174606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aB1XSrRG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dDOrD4BC
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B48r2595115
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G9iILtelhr8Yu2FohoGwzQk0
	gRPwQeEBjlv06/YSbwE=; b=aB1XSrRG9Tg9EV5Kujh1v5n+6HaPnQH8HSHhBcZB
	DMSIjQjak7kWjuy65DcwYjRRe8EG8HIb/pgErYMbd2yTqRdH8kdfLPWDBP7I74mu
	oAaag5esojBzSIyfydSwLotzVG2E9fxYZH+QbY9TEFZVQkAJ/3HeIKcpFYEEWKO3
	oGClV93Xh4hMwegJtAqsDhBOnZJ3hVZLdcmYJpBN7xpavyJfUNjhiyYOYN7JBKsl
	bQVLQU4xKu/7u2HcFK1513Nw+O53TnM6gj09LynunZ982VnnLYn69kKt9xgaXn9U
	3KetkbIF43Mtywx+0CK+LsFz6k+7qcUOfFHllJAhjgebDw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sakru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:01:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949b0d3232fso947525585a.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687271; x=1796292071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G9iILtelhr8Yu2FohoGwzQk0gRPwQeEBjlv06/YSbwE=;
        b=dDOrD4BClu3JDoM0FEZktrw772K0JJngFl3nhlYzIlUsad8sZCNfYe/2XM1UsHOhNB
         02FaJPhFTTLwP6CBst/5Z2GgO4d0lFKLJ2SuKrOnpNHCOxAwW6ZE5QUHiT56WFPCMoDp
         IxN+DbG1r7hNgo5HXYqh1/lyCryomFvF+/aD4hh8pjuB6jMe6aC7b8RIkd5556KLjdNh
         0gB4Lu3OGEp7+3u3PNNy416iA/o5msMJDHgBW45pC8CeivtWd+sQavurK/bV0HyMLNhA
         zNStLakXizXXWPVCGZ8YRgr5mqh2w24SsKkmUtiEzEua62Pmgq6BV1hZf/BWufBhhJQT
         2OtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687271; x=1796292071;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G9iILtelhr8Yu2FohoGwzQk0gRPwQeEBjlv06/YSbwE=;
        b=LwdOUWotsz2y/KI0TgwOX4BR9IkpVVWezDJWIOUm5g2gKQBSYEHpp3XLQaOZB6zNNc
         m7RwtAkebEDPmCFJT1sKGAQTTU1jA4gRwXo2N0tbGOnT89itUH1Dhq/WvZqkp3kcELlF
         fPVaNafdMDqfJBumRSWVSmvFjBJ7rC0E2B8TSnBqtFcSLvQpQyvUw3i10lYV/9IhDhye
         0IddblcGWVkfCnJH9m0m9HkK1JyQperVo4Iv/EBnyBPsLILkBKiL9ipExJR5ZfprDLfl
         r0J8fljvK4/70m1wu34ylj0ZzPtbp+ZpeXyj5GG2A8KF6lboiSBT1QHLiWegVeqbeF8y
         l1EA==
X-Forwarded-Encrypted: i=1; AL+hErGd56U8qnFANhbDCyOSnQBhQ3hI28wL2XsaA9d5IcJ/yYRVKVPKBGuBJEmbnEDQqDfd8z1TEq5ZaY2J@vger.kernel.org
X-Gm-Message-State: APuU4Z+gaVkSpostWd4vnHtY0j7OzHnGVUa4V8fa5j/1zT2DUe02/yUQ
	vCKcQ+tEDTVDc29KfU9HgWjctJyo6YCnF8S6S943ZVDotiHAh8IY91W1nzKXf8KDKqNiEbY/J49
	KrrclXfWtmYLkz/Yh0PRMmSjj1Kwbb7p3Eqd0RuN3nAwada6aCU7fgMsIGqG93RJu
X-Gm-Gg: AZFdTZfeD0LZnHJMvdid98eRJjOJLVQXMJ9MKl7d3YRn6/0/61V2M7uf7i0IhKwFflc
	s+PLF8eIrPXHQ7TWrre1zvcmd064YZaHtUeOCeXFbP4qstpAaOARi5qvFhFaeMGBaRZ9kXgf9Le
	qy4Szttn2/VooU536l24bonrrNxE8hdMMRIcmBB03jko1gAgwpfLctO8GxRF7dwoEUcZzPhhcQb
	MAAjfgkmudsgYm9HtMmaAYIWq8GQRINpm6tJhgnJEluZWyRquh0Xf9pJJ1JrQ/8VELhhA93Suf+
	6/+6l2vdPGnbSgkD168p2AoxuxVtb8G7DKQTmUgWSR2XgxFVAt/dE+FWys7pNejDUc8McqOyrrg
	hdEmYtAep/2BPSiEtFKVQLWGRhju1iOGsZEtv1kTBuz/xgrDzFND58gxzIWgOg1c=
X-Received: by 2002:a05:620a:270d:b0:949:3ea1:3021 with SMTP id af79cd13be357-949bab6d711mr3557296985a.68.1795687270721;
        Thu, 26 Nov 2026 02:01:10 -0800 (PST)
X-Received: by 2002:a05:620a:270d:b0:949:3ea1:3021 with SMTP id af79cd13be357-949bab6d711mr3557251685a.68.1795687266480;
        Thu, 26 Nov 2026 02:01:06 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm38799609f8f.40.2026.11.26.02.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:01:05 -0800 (PST)
Date: Thu, 26 Nov 2026 11:01:04 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        p.zabel@pengutronix.de, andersson@kernel.org, konradybcio@kernel.org,
        abelvesa@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
        fabrice.gasnier@foss.st.com, alexandre.torgue@foss.st.com,
        marex@nabladev.com, changhuang.liang@starfivetech.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add TC9564
 clock node
Message-ID: <awgDYC5NDhrtYcVW@lore-desk>
References: <20261125202141.1288493-1-elder@riscstar.com>
 <20261125202141.1288493-4-elder@riscstar.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2fAwCp9gELKVaB6R"
Content-Disposition: inline
In-Reply-To: <20261125202141.1288493-4-elder@riscstar.com>
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b080367 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=ee_2aqc6AAAA:8
 a=EUspDBNiAAAA:8 a=DTxt4SQFiI5XT4Iyg4UA:9 a=CjuIK1q_8ugA:10
 a=1mOaCQywVTqKKdqfoSYA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: 6rLzJFnhi0DJx4iq4txdYqQ6C3G-6OjI
X-Proofpoint-ORIG-GUID: 6rLzJFnhi0DJx4iq4txdYqQ6C3G-6OjI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX40VVy1k6FVnk
 RF9Gn8uRYHVKd8GeaGcWGmFbw91/EFsqZFUZ5L0woaAX0Zzseu2N4Uat4QqRgTw/BObnTo4546x
 Qneb1dkuybFpWAqlkJEJBxnPj0RV4epdm6kEVOsbp5pkuHY9HqUJhBAvtIO0AW/h8/Iwlp+tFBr
 /nEeQ9G9zepTwrSj8VlwlW16KndrYNBs5fNJZoUb+zLpZKL3AUSvNBzt5nh/xK1Bx4GCgtnXcDS
 2SS53ld0z61uxhCwT3SK0nZxvEyaoU8VEFEa7lW4dORAhVuHiW+dBucIyzdiadamZU33ZMcFqe8
 V23URKznLpFvLwkKQ+q72YzrlPKRbtYuunNn96QMCB9nQkvYNPsA3euSkACEdfp28Q4/CU9nE0t
 7jLJu0KHARtog5OLlBxLdHLaJ0qyDw1KIR5MDzTSi5Vaq6yFJtIgR7SrsmcOF/CCPsFU6shZ9uq
 x+NGbU9PN6iDbU39Dzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfXyFNS0tgkWFKg
 6oyZCWopefAnZRS3Rr7iNkZUnFtLID/d+fHqh3aEXM9iwdzO+iFwBxFBGNvNzBeAR6jg5UmUP50
 CvT3NSwSGvwleEYWV1GE2TOoX1uix5Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

--2fAwCp9gELKVaB6R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Add a node for the clock and reset controller found within the
> Toshiba TC9564 SoC.  Also add a node representing the fixed
> rate 25 MHz crystal that supplies the chip.
>=20
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v3: - This patch was previously not included in the series
>=20
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

>=20
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/bo=
ot/dts/qcom/qcs6490-rb3gen2.dts
> index 682bcbc0b466b..b327f64885ef2 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -890,6 +890,13 @@ pcie@0,0 {
>  		pinctrl-0 =3D <&tc9563_resx_n>;
>  		pinctrl-names =3D "default";
> =20
> +		tc9564_xo_board: clock-25000000 {
> +			compatible =3D "fixed-clock";
> +			#clock-cells =3D <0>;
> +			clock-frequency =3D <25000000>;
> +			clock-output-names =3D "tc9564_xo_board";
> +		};
> +
>  		pcie1_switch0_dsp1: pcie@1,0 {
>  			reg =3D <0x20800 0x0 0x0 0x0 0x0>;
>  			#address-cells =3D <3>;
> @@ -969,6 +976,14 @@ pci-ep-bus@4 {
>  					#size-cells =3D <1>;
>  					/* Map 0x0-0x1fffff to BAR 4 */
>  					ranges =3D <0x0  0x4 0x0 0x0  0x200000>;
> +
> +					clock-controller@1004 {
> +						compatible =3D "toshiba,tc9564-clock";
> +						reg =3D <0x1004 0x10>;
> +						clocks =3D <&tc9564_xo_board>;
> +						#clock-cells =3D <1>;
> +						#reset-cells =3D <1>;
> +					};
>  				};
>  			};
> =20
> --=20
> 2.53.0
>=20

--2fAwCp9gELKVaB6R
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawgDYAAKCRA6cBh0uS2t
rDJeAP0Q6+VXzDX3T4Mxc0he53zTGBAW5n6sPUtB0OuXRO2TaAEAk4D3UlGDtfnO
vcLGfSBOqjIkzTbgYiQdQ6pQ0DDeQAE=
=e1Ov
-----END PGP SIGNATURE-----

--2fAwCp9gELKVaB6R--
