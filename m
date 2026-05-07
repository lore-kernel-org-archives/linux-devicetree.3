Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2127.outbound.protection.partner.outlook.cn [139.219.146.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ABE242D9B;
	Thu,  7 May 2026 06:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778135640; cv=fail; b=ckR/88BLf3m11Ipz+lelGUDgtOELncf4G50zCYCX3QX54BAgs9Gl0beOTWa9cLVauk5dlLqNdFX5akl0LU6STX63jj5j9OzTetcIFs//781Q+bvuWvYhribaGZo2cnequmkKxGl22J4vw9BTLJJRa0GavK0RCGT20aGxNqIpj3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778135640; c=relaxed/simple;
	bh=wUV785CmhRXvMLOtt2qfTSr8zzGI4GCn9K8ydVRadBg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G76nLsrFqrAizsSoJGc9eC34XFe0gWqlEhUY2nW7wLeWEptYpIBlqA3+A6H1FDp4anT+FYEw/m46Xkdmz0VHQkXw8synMHeKYhwL3FR0E7JPozXD1ZwJSMOTDoqTota8ZgxFrS4n0Wbfx3MVY6de6k3WaN3JotnMRT/RoVJmMMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjBLq7rjLIgN2R47tcg9Xwsz6MStTcuRN3XfERRVd1/SiDRGK9PbLKznplZ9zH/FS5+DMWOYOq7/x6mlOeRclwxqSR6syMMOyKccwo/xffOj9/yXPar+61uWcYm0KIVvvUilBWn4EbT4QXIwkoOflBcEuNSOp6ftckjcDS4SreSNCR2oaqX67etl6mTHpIdkv+chV7ymIEfsOOYDt5/oDBRcII7qAvNeF93OTsYe+1cFYuXU1vx4bTSBpYQl9eP+WtRlBF1hML+CtLFfS4EXLYkqGQ6aqvPM5z0vSjaDF7xFSxf6fJJBZHsKlQlEqprm1Ovb7uTkOdXpJMlV8ttsZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LP8qashgR2mJm9oRkv7Nq0XE3g+8HOdT04ZPGANXGQY=;
 b=TEHk7TNf+VOjlRFmuUInSvY3lZJYQ37q+U4AW7H0Qwak8v2JYvq3fqlNOAEGeTqcVsT4fzc6iTxdhE2loJ9lNvq/yfteSUiLUZoezMlj+H/G/3hY/+/bkAbRA21Mb/Sdg02W6BR6UERS1Er5FCnlj12brjIAXvrTZmStvtuxAF2nVdMxNNizZ3hxBAyxbMqqKlBGPhwUCULOowaShv1LxbpigDIokCp9ZD7FqT8JuRuI5Bb2CwL++hWzp0vtl8QHIpDEdgqNUuP373YKk8AuvC9l6UA85z6yIrkg94qUz5q0/zG7KkaQgYOUPSOjbsUHXpvBb+bcA83FDl32nUySBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1323.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Thu, 7 May
 2026 06:00:44 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::4386:5cc4:3bc4:4795]) by
 ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn ([fe80::4386:5cc4:3bc4:4795%4])
 with mapi id 15.20.9891.016; Thu, 7 May 2026 06:00:43 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Thomas Gleixner
	<tglx@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@kernel.org>, Emil Renner
 Berthing <kernel@esmil.dk>
CC: Yixun Lan <dlan@kernel.org>, Joel Stanley <jms@oss.tenstorrent.com>, Drew
 Fustini <dfustini@oss.tenstorrent.com>, Darshan Prajapati
	<darshan.prajapati@einfochips.com>, Guodong Xu <guodong@riscstar.com>, Michal
 Simek <michal.simek@amd.com>, Junhui Liu <junhui.liu@pigmoral.tech>, Heinrich
 Schuchardt <heinrich.schuchardt@canonical.com>, E Shattow <e@freeshell.de>,
	Icenowy Zheng <uwu@icenowy.me>, Anup Patel <anup@brainfault.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: riscv: Add StarFive Dubhe-70
 compatibles
Thread-Topic: [PATCH v2 1/4] dt-bindings: riscv: Add StarFive Dubhe-70
 compatibles
Thread-Index: AQHc3TaxszhIfmGsv06WtAkqYfzX1LYCEz9A
Date: Thu, 7 May 2026 06:00:43 +0000
Message-ID:
 <ZQ2PR01MB130774715686EA113220BA87E63C2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20260506085937.754808-1-changhuang.liang@starfivetech.com>
 <20260506085937.754808-2-changhuang.liang@starfivetech.com>
In-Reply-To: <20260506085937.754808-2-changhuang.liang@starfivetech.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1323:EE_
x-ms-office365-filtering-correlation-id: aeec53fe-e497-4cd6-3268-08deabfdf9b0
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 Ip7YJUk/jcDbB44TLUSoE3I5lX7bPRwi6ZuM7EMnr7BPajQLZ/wsN6z92tDopLUC0PqgAO52FFEvAXHKVwlEv8tM8S48jwUyHTO2YIK+/0g6ai2xfVU3Mx1BIxpOVi15W/E11nWfDLDTC3drctJIVmFiTGMP1NSXJKYmlw95x9izHPmgS4s0oq0GaXCYONx2MDigtrI17Al904KE8coFpYaxY0rOJaZ5jQ2FpsuorAjC/vP4v4m+1hMOd1NCGIFzP3j8WEH4MsIoZ3MR+uLf4Wy9ICc3Wm4WNVx/2HAB2RZA0HFr5QsYQ34RSgdkpv+mwkTBRb9meTp6kaf5NBROZPoynA0n3a8pvG1ZJjXmhuSAL0zPlRIKmSnpeOBFUf4SOlxG000FwywWpTcoumyV8TBtlwFuPmTTsJ6lCx3dBY6oyTQ9n2/8oRWXoypvFoF8pjRR+4CO2yC2HgUO9ICFpfqOFoTwNDC3DqnnQxE4dVFI1w6sOogKDEKTASuqxnIDnRTxJFlsAXT8fTSqGkQlsVyBh9EmsLOiSdP3iysc2bAkGPJ6BuWC+Fh96zwQOrLeMTEqbzoNrT0GeLI/ri/EwA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?l1EuDqjmsfKpetrEbJY30YyV2XXYslat2bExLYcdJu6SObASjiWvN6x1GlFs?=
 =?us-ascii?Q?NI8uhVn3s0jNnk0wVkSA1XPY6e8gk8OtNVpGPcZ3qMBl6ODdtzxbAdkvKRKh?=
 =?us-ascii?Q?UPJji6+J37nGWe0MFWwXthsNAT/pYKo2IS3fdbJhdYHxm05Rpu8beiky/5nL?=
 =?us-ascii?Q?QtVFa4ojnPjJZyXfnZUZnSb8X+aZQVno29fY9iwzimiuSt+OrzwgM73Paw2/?=
 =?us-ascii?Q?wSIxOPiu6ZFk+HjpacNUMhOS4ARFPvVN+qJeAtY+pV03O/QEK3CAZ6zdGeSY?=
 =?us-ascii?Q?0waWm+4UVmXRzCkOY+Wx5jvwlgVyNPL8W+M3LvCXm2SmKUKqWHE9B5aTT5o0?=
 =?us-ascii?Q?YwxLTBWXfRbMD+7BRoGYg4WJWrxJp3mA13cREuWTH1c9/6B3u+/QNs3ZtJ9U?=
 =?us-ascii?Q?yUVyLaToBWVtMJuu4bFZ9trQYo3P3fX+8uBzVPddF6dBkIOm2Hoh7C6xVzv9?=
 =?us-ascii?Q?mNQ+r+XAQzg/I7MnWE83B36WyzzCnA1uunbFNMLvn9KGRj69g1xaU9+WSAl1?=
 =?us-ascii?Q?g8x4jK11k9wvZzzwO5fGIpXoSVcpELsqk5kgctYnlJ0o6yDPrL0rJMMJ2my1?=
 =?us-ascii?Q?987z1MlzxFz17o9CtngDbJVZ569W6t5OSAAcCQ1nS3m/UEu5OqrTDyHHQ7tV?=
 =?us-ascii?Q?1500Sa0mwybis6uW/zMTbQRw1ptR/K7fwrr5eyPWS0FB8WAI4UuqdCh0AMkc?=
 =?us-ascii?Q?2vAXyZ8FlD/NwtGXIOGlqjeTwJv7SHVQtxZ9TQoRIUvCP0wypbvFRl0XkZ+w?=
 =?us-ascii?Q?CdoMplrIHQC8YSnf9RGXfc69mRuLYRAzyUdflCarJkFDqeC/91Pfs1psphcH?=
 =?us-ascii?Q?6rSX4RcQi23ENx6EnsYOzdy+d5/YbjRn3Ss4cIb55lNf8e5bjNBMSRK0shZU?=
 =?us-ascii?Q?QK6TMwvqnNmHU0op1BAKjJd4IW6rmMuxdgAh5uZNt1RoULSDNfMb9YIwkoeW?=
 =?us-ascii?Q?ujWM+Sc5/VMponAIQqt2l4M5eoNYLS0y5eobjft0te6dsEZ3SSuK1IxeWuXa?=
 =?us-ascii?Q?IIHv/ZsGvrDTWlXS7KWxoAx8shZL4fqctXNpP6tlEZKV0WEhEK+FstF2pV3/?=
 =?us-ascii?Q?t778r5xA0RNUMKo7mcsE5EOWlsdcPuFsixhC5Or0SgWjTjKmPCM6QAb4PT0b?=
 =?us-ascii?Q?ic7TbGkUhe1z2qKVX6nUz2+zGuAWcREpS+8b39NstwZ0jEe6R8TX7XziDjoW?=
 =?us-ascii?Q?KdB38AWblUyo49divqry21WaNaKI2KSFJGmCQAIUI6QgKxrsSogMhkhG5FB1?=
 =?us-ascii?Q?2cFAgBGXf9wZEV1KCGlB4g8ADueMnC+/UCfYWN5lh2WZdMRiVg/FHBsC1Rgz?=
 =?us-ascii?Q?Tikx6A6oNzfIj/6qlP/MNdSIKHuGpq+PD+f7TqwLQ1QeEPodxKJINwyr6WKB?=
 =?us-ascii?Q?hS99F2qlDrpOi7SPCzOC7zE/IIhI2hzIlAQU3kDVYWcebzUIX/Y1t427k1Hv?=
 =?us-ascii?Q?SeyBTs9dGiLr/PWaMvYbDhQKt2optmGwastt4NUvuFg+8sQvGU39dmSA4+yI?=
 =?us-ascii?Q?Tj3jb4PafxcAcgOW915q5zxnPi7M9P7fRI1ZBg3mQMDS6HjGgHqeuVglr/ri?=
 =?us-ascii?Q?3GIYvXuSv6OlnqFtV340kbeC72pcnJ2tUTzmhZcD0xPENxwPKLDuL+si+NSY?=
 =?us-ascii?Q?Bv7GwYADFp2943VbZC+6A2W+Tg+zZ1YG3BW062Ymx0AswKlVjOkr+jAO2CXK?=
 =?us-ascii?Q?pKBENmDRblAzc1NrCTmPpeun5fpMvIDSY3VMwHL4eLr4x//tNf2Ykhd2j2ec?=
 =?us-ascii?Q?x7Hjz4cfdw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: aeec53fe-e497-4cd6-3268-08deabfdf9b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 06:00:43.6902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LcjeFRPZGU16kIMFO1M+PbtKbaQ4Ejf8YoErEto7Qg7fB0vhV+F9w2XpN1he826PaGU0juQxiz7THa8W0i3StQoKg7PMBIaaedThvwXQgmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1323

> On 25.05.06 17:00, Changhuang Liang wrote:
> From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
>=20
> Add new compatible string for Dubhe-70.
> Dubhe-70 is a low power RISC-V cpu core from StarFive Technology.
>=20
> Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml
> b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index 5feeb2203050..e7eda7a9c345 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -63,6 +63,7 @@ properties:
>                - sifive,u74-mc
>                - spacemit,x100
>                - spacemit,x60
> +              - starfive,dubhe-70
>                - thead,c906
>                - thead,c908
>                - thead,c910

Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

Best regards,
Hal
