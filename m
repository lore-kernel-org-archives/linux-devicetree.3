Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.103.14.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793729244;
	b=5R1dK7+bKdEB0dgxYNzFE46nHHDP44Vgq9YyG1bJ6mxb9A/z7iTlkwv5X/lQh6vo0+X7
	 xQ5VJynTq5Bwu08/LcFOUoLegHasTYqrgwdGHz5c5OErsP5INSgbHERbtyzLh7l8AtQqk
	 3C8Fdt6KpW9HvWcS4HctW5kPkhdjWA8VqpFCfdm9Yn+ifqF5II+jLlX9pBnMCigc7Ylft
	 ZGyeAWv9UJHeyQtbcjYYEtdRoGOz/UPRCDqZZZvjQgZIEHMyDZ7RpAhEqNMMT+ffw16oU
	 3HarMr59IcB8bDTBARU1KYDaq++cnH9YwwwHyj8m8Jy6gQ51qt4HkFO55kN3LGBDFYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729244;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=amMMlLjmaMZVDNsAPkp0WG9wVd6azK38VXhWfvPevlQ=;
	b=C0vsvFbREsMf9ccx032amPkkyykOOFgwtPmqFGXK3mZcJYRptCVODr7U7W4Mkx/UZbhw
	 V9Q7K7ttThLh9Z+a3+yP2477RRheRSmJQpp6Cv18E8ogMAQ6kIWiWLXLpV9gR2L7ZjVfl
	 7aWEDySTb86gh2rTR4nvnvRb/u9KKWLWvDcr/YycVDSWhUhK5J99crvpRX3Z3ODWsFYVT
	 odQlEyuAA205V/VZs9GK5NjKDWPFHF2RkF1wCgyHJ7SOKCu/1flzdz8EENdBm6WqkEmyt
	 txBMhmLvJoWVnB50/xR8UNNRR4rAnUTpl6m8zLaj8lp3PNteVG/jRIiBGcsdQbcrIVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=fail reason="signature verification failed" header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=mdvQIJ4P;
	arc=fail smtp.remote-ip=52.103.14.11
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19012011.outbound.protection.outlook.com [52.103.14.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C8F606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 18:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2C8F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=mdvQIJ4P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+e7T5a0L9q/2z4druD20o5Sfeho8fn6l2MC4tKE5SCIkl+9WnYyasKl+vRC/XHVmSQK331trV/UJmyKxpxTqtM4FP1RvTO3ThBpm8sZMYSyHacJ7KovI09KcJ4AMkolSWfdYBph32BSIqxBS3GqB69zOjHwE3ktROcpFpBWE6BXoNRAZpLkoS/Z/CFDx4Uq0mbMOplVpt5Svi0AOj41/Ba9V30sXq5YJGmWbyBbiniQkAiDAwebeju5Ji7M5gK0P1eh8necoj8VlXyA+oZBndql2tYe98BZMqB22PcDCgFtbpUuelfXxpKssxxEEtMjP1bmdteQlvoSMn4IIOp5lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90lnrWcFTUAatRTj/raHe6MLnRalHX+RAVcx0pQTZqg=;
 b=qdIMcXo3Zq8M71IkqUN3PcJxn3eR23vC7huxRyjvSFrYvsPrGqL1AQ1xei7DCBFQWPdGLpPTAaXqYAVSVG8qKwoQEag2Bw9ndrlS8zNiDAOK82b/uYLRLXwyDUfK0510PJiK2CNzvLFcoIXmkbPK2ZOJ1qUV6SYskUsS+qf3q0PZBV//RFLniwID3wnAmXNyUQz1p28ueHhv8bSHXv0Tx6n3XRF5zkdY4ipTRAbwQA006dBjmEjPSqYlp83Kg9rrVioeSokI3KEMfyFMxBq62oPLViWE8jIldEYpF9WAEWlFIaTc/5ByGnTzdTs7Q0/SEx4t/TdeBebwitrKO9ZyNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90lnrWcFTUAatRTj/raHe6MLnRalHX+RAVcx0pQTZqg=;
 b=mdvQIJ4PasJUeIpG+U1aieVOXSGaYVGW8bxWkTiTQZGAnfzLhW4zh71h1fBXbaBVBGWlUjP8vWZ0EciNVOBVJU/5Y582sspKfQ4HVsMy8218dIr7+JQcxUZTVfYpqEK59rVdb6VeDmuct1/PvaidYNCZdm/EaTeUmu1MQ+sA6LhEjlM7GBl4DT30WH5xr9XVsevCTZwwlXWN9XFdQwPeyvtQBOVmPZQ9bcK9uGu0e2JKCHmHsC8nN90flZstvAOrky6kyOorSDwaVySIKsa4yGOo9r4u6Gi0P5M80vcJyfIWD1HanvZ5fijU4scApI8K719lMgkMM7LG+fMPaP/7Ig==
Received: from PH0PR19MB997338.namprd19.prod.outlook.com
 (2603:10b6:510:3b1::18) by SA3PR19MB9427.namprd19.prod.outlook.com
 (2603:10b6:806:494::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 18:07:22 +0000
Received: from PH0PR19MB997338.namprd19.prod.outlook.com
 ([fe80::fd22:ee23:3e25:3172]) by PH0PR19MB997338.namprd19.prod.outlook.com
 ([fe80::fd22:ee23:3e25:3172%4]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 18:07:22 +0000
Date: Tue, 3 Nov 2026 12:07:19 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	Chris Morgan <macroalpha82@gmail.com>, devicetree@vger.kernel.org,
	shawn.lin@rock-chips.com, diederik@cknow-tech.com,
	michael.riesch@collabora.com, conor+dt@kernel.org,
	krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: timer: rockchip: Add rk3568 compatible
Message-ID:
 <PH0PR19MB9973388CD960185681A4C3E16DA5692@PH0PR19MB997338.namprd19.prod.outlook.com>
References: <20261103153144.343764-1-macroalpha82@gmail.com>
 <20261103153144.343764-2-macroalpha82@gmail.com>
 <3661431.qSoW2BAyJ8@diego>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3661431.qSoW2BAyJ8@diego>
X-ClientProxiedBy: SN7PR04CA0093.namprd04.prod.outlook.com
 (2603:10b6:806:122::8) To PH0PR19MB997338.namprd19.prod.outlook.com
 (2603:10b6:510:3b1::18)
X-Microsoft-Original-Message-ID: <auoi184KI0OGJbcT@wintermute.localhost.fail>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR19MB997338:EE_|SA3PR19MB9427:EE_
X-MS-Office365-Filtering-Correlation-Id: d8adf13c-5eac-4c51-5624-08df39d54e64
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|25010399006|4140399003|19110799012|12121999013|37011999003|5072599009|15080799012|25031999004|6090799003|23021999003|24021099003|55001999006|52005399003|40105399003|56899033|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?EPFmb1YLvCd+PgMqEggX16T6XMH3mhLy6JZl0O3Llx+yCNJxp77S93axZe?=
 =?iso-8859-1?Q?oI/YCqLbrBuNzs/8JaGdUxeugpjuckNcpUKR37GfiUUQllV8uwia/hBkWB?=
 =?iso-8859-1?Q?vz+d7A08XqZbyPLVj5xKIFmDJAkmzame1dQGjUmRT6GqbbEs6EDMPfqccr?=
 =?iso-8859-1?Q?/mE6+XGgBiNXIYi0kc3ye7JzjYbyhiX064KtOJWn20VXIrmly5tvrUSTRC?=
 =?iso-8859-1?Q?KaGOpBBzR3ay0tMEYlP1kPkvN8L4IDuqHC9HNoPq4hkjTP4s1nYVcnvL3m?=
 =?iso-8859-1?Q?RMXrhYwbfI0tDU4BVlQDOznZ0OF4+1wVd22aGVB0XI4+ihc1pmqSjWAD6F?=
 =?iso-8859-1?Q?fIc+R6x0/DbK2uyo10Eg9U5KYp7oKjVLdoQ0v9vYKuogTmJBMTRjty9P8B?=
 =?iso-8859-1?Q?Fd4ChDKItf5Uf5RZx6E1IvzQuSa+v/HF3X8mcQ0fi5IruYXUpduB/aiGBg?=
 =?iso-8859-1?Q?PzbR+QMj55SLN4hdSvzu/QhP3+p+KycT1MYmXG0Pe+6taQVhj5NDit0WQS?=
 =?iso-8859-1?Q?Tk0aFCISCGGnOuY5p2MwIAwp+2DW785vFKpqa/N7yXSohmE8UNalql2UTm?=
 =?iso-8859-1?Q?yhBCgRA5UFekhgXa98aVkc2KsDHnMgsnyG+HZWRnCvKYdQiZOZM9UIO6wC?=
 =?iso-8859-1?Q?4CSoLU0lvXDU2xFfQkoFidfpEuH1FNQTKS9RDmfftD22WDvFjobauNY3Rs?=
 =?iso-8859-1?Q?YPsEIY5CrDtsz0cHgkePalB1D2dwZda3UXppKH0NMhDIhsp6fe8wOZC/w2?=
 =?iso-8859-1?Q?99jWEVyyUdWhBQNhGSXDe5Iat1IML4rHj5IsPJ7mMWr+rf6osVoBIPElY+?=
 =?iso-8859-1?Q?ZzT8afm2IijDU37v7ToVqCGEgfBX+KC//OT0HyTKAm3E1WKXaAOY6GiD3/?=
 =?iso-8859-1?Q?wMHppf14Fre6nEBY+foMzh4/SwOFrwW9+K7hOcR6fsNGSR4nutsgWW0iZF?=
 =?iso-8859-1?Q?F+gLQ+EEdtTTsL8CQsk1PYWyFprgaHmO8DmTXq8p19f90QpDZ8/ZIH0IzI?=
 =?iso-8859-1?Q?mr0a52l10MtJMt4H7ASUSj2nHn4ws9U2ioEr5l4ABZjwm4pR/Ka6RgVxRU?=
 =?iso-8859-1?Q?PEUNdFO33BU5iFjMhhfeYdukBYwbSvs0p5q3+eO1spt+nfeioKxCgjyJ0C?=
 =?iso-8859-1?Q?CGuGLldAZEsIaM1YsH+IRko2mnEL4=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?y98GTm44P20FouGzxr62EGF8B6wtKyn3eTtPiGorDRr3na7QglMko1GErU?=
 =?iso-8859-1?Q?GQ1R3sxkSBgNqJGKk5gmCrnBR3oMHdkmy/YiMBg4Sndfh2r/DW6Q9c9kD/?=
 =?iso-8859-1?Q?2tAxH9lJaMVVFizNmin/OCrD6rTHk1zQsZ7otmtmgS+OKhmSvnHPideHfy?=
 =?iso-8859-1?Q?C8svSmgNwyvf11fWUwDOW+ckY3nYNuLH2jTeBnXaNkK2/IzBIVZPy8wTYT?=
 =?iso-8859-1?Q?LURAmtFN5wI8uUozVdc+ZMth1sT6N2R9U904KcUiVqzEHsn2YnURgymBr5?=
 =?iso-8859-1?Q?Mc8dYlr+uCp/9Iln4IeQZjJOTPnuQyG6MdMUppybG2uBDOllMbZ17DrbQ2?=
 =?iso-8859-1?Q?VSLjqVWpvrhT2HnSQNSI2TC/m4zCvI+YlNAkZMZoSXdGnFJnuG053MNbZx?=
 =?iso-8859-1?Q?M0+YwHdb0ekG3UleQdRlxKtIg8xdPn+hweHfhtUbK2bhz2XOwUwxyZb+I2?=
 =?iso-8859-1?Q?B42Dun5Dti37R9BF3GnIqGjwpPQnBFb7fQTZFTRLD0DYwJT68hwU3JA4iF?=
 =?iso-8859-1?Q?zmMXZMPIOdu0R6zzrmqaYZb6mfYqGaBOyu1oWEdNUR5Wd85b884Qxq//S6?=
 =?iso-8859-1?Q?zlwh8V0kt9UtUyp/+62Ab4vVz+e4QI4SFOBRM1qCAe/onN4LZDlhkAn9Q2?=
 =?iso-8859-1?Q?+ie19Qr+6rS96fLSofyWQdWntIyIUyg3Ak77qsXO7/pphIs30QREjP78A6?=
 =?iso-8859-1?Q?HZDCRlhiQP8HIe1HWb2RGTwIczrqxcEaSwVJHBZ9gb/KUwCe2QEsAR15jc?=
 =?iso-8859-1?Q?QViSK3y3jFc4W91C2WyZMrmv1fQm8/RW2etiC3pycTTxrI5XxmwP9seDrq?=
 =?iso-8859-1?Q?eF/WhEZy9MHFT61wQ11f5VrR8UKIfqfvjBm30Ra9ROAy00MLOeoDkYIE64?=
 =?iso-8859-1?Q?SCKRQlAY4H/XOlxVXZWPXbv+VUMP9UtunjXcHckOfwvixund5mupkDHUbO?=
 =?iso-8859-1?Q?lHfxVv3a20wHy9zM2mG/MTGy4FnZ2slv5dhuRf/MmRcKPvReQstgjTXuzI?=
 =?iso-8859-1?Q?0EXI+NwdzBHPkNLCnKeNbf1AqovtIlHHSHbCkTwDvvzZtmr89htj2vB3ew?=
 =?iso-8859-1?Q?qo0/bmgqq+BVocJ8EFm1uaDq2RsbclUMnCTAF83KaUMJlhLZmDfjZsEqni?=
 =?iso-8859-1?Q?ABDHSAVTs2k9TTwkRA0aSj/E2//+lnN8jEHhHQl7yp3BFHMZ2lHBjX+NtO?=
 =?iso-8859-1?Q?fI91bLKvGGnA1IjDH/V/paZPQixyMX2c6sDKU72v6dzdEoHWCd/CW3dFqu?=
 =?iso-8859-1?Q?CMlMwU8pp6aqGRvA7S1M3YMkt0TxqkQZ/VBhxxdzizgtL7wd28nghpZCn/?=
 =?iso-8859-1?Q?LW2ZeZAZIMPCkqox07BZnYL1Pq+Cx6ef3jVTSyvhjknembADuIJeqgQDK+?=
 =?iso-8859-1?Q?l/eRIE4nZVuvQb5ytjCMwR4uON3auHhf8A1hbAkRxUQTHednAGSc1F+OSK?=
 =?iso-8859-1?Q?33slLqmHCaokbzpi?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d8adf13c-5eac-4c51-5624-08df39d54e64
X-MS-Exchange-CrossTenant-AuthSource: PH0PR19MB997338.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 18:07:21.9031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9427

On Tue, Nov 03, 2026 at 06:01:37PM +0100, Heiko Stübner wrote:
> Hi Chris,
> 
> Am Dienstag, 3. November 2026, 16:31:43 Mitteleuropäische Normalzeit schrieb Chris Morgan:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add compatible string for Rockchip RK3568 timer.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml | 1 +
> 
> Please make sure to check get_maintainers to catch all needed recipients.
> 
> # scripts/get_maintainer.pl -f Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
> 
> you're especially missing the clocksource maintainers:
>     Daniel Lezcano <daniel.lezcano@kernel.org> (maintainer:CLOCKSOURCE, CLOCKEVENT DRIVERS,in file)
>     Thomas Gleixner <tglx@kernel.org> (maintainer:CLOCKSOURCE, CLOCKEVENT DRIVERS)
> 
> and some additional lists:
>     linux-kernel@vger.kernel.org (open list:CLOCKSOURCE, CLOCKEVENT DRIVERS)
>     linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support)
> 
> the clocksource part does not seem to have a dedicated list, so
> linux-kernel should be included.
> 
> 
> Heiko
> 
> 

I apologize, sorry about that. I assumed since I was only modifying the
device-tree and bindings I didn't need to copy the rest of the teams.

Should I resubmit with the additional names?

Thank you,
Chris
