Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.154.164
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795129081;
	b=ohXJ2eTwlKQ2vocUluqom/XE3CcFiBt5iXC/IsxzImbc0viNTDg/JdqdPjwSe7b2mvtO
	 KkNaPwNbBfEKghuVwR9zoHzHw6gjpi1jkzW3IQ/UNF7ncwWifzxs84n866qMtwmLXjWvv
	 4hdu94ku+0pcxA8Y0JDjsEI3Fe+YbAi3GDtixS0RvCxosDS4JAY1c2DJdbS998/A4NNcT
	 /9n4C4LOltJ9syHM80E9/ADmXo9f0ymSs5zCf2APrQfsatLly+cQCqj/vBNDu3DhdIE9G
	 OGOHznzngVFGIVMwZyBax93K+qYdcLSHod/MDcI28RGWrkOPvP36mmyKvpIwRH7W+Xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795129081;
	h=DMARC-Filter:DKIM-Signature:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-MDID:X-PPE-STACK:
	 X-MDID-O:X-PPE-TRUSTED;
	bh=Dz2jiH/aVVCVAwAB2BHKIhTJchtjXu6f+nwQ7XFMGQk=;
	b=4m/XVxEm2EK02ciXPIirmyeMu1zjjZ3PfdC+NXtz14JogOgINwrV/baORND5a+yCfmgs
	 cahAJEaI1rK6Gd1H7KA2DlbKa2sAjurZRUvzlo4YcVZ+kxURQhILQOmvgS5o+GrQVdpB1
	 gQhcOQOjuXhGmRlnzjAjjCfLyntVcI+GEda8fcj48Aw2oaB3UluSTOz7TX6OWPBecXKdu
	 EkhUZKJqta1MjXQRLQfXX9VSeQlSGWGEBkFjolZ7WxQ8GU3xaJyCEhOk35JK9psq4iuxs
	 2qbZDgGA4ubR82u4+sNz3uLbwb/wx4apuRTTOA4xbVG1Uk1sHGT4fswomFNnKjjFvmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sitime.com;
	spf=pass smtp.mailfrom=sitime.com;
	dkim=pass header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=Q2vEj1kh;
	dkim=pass header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=wo1DZyvA;
	arc=fail smtp.remote-ip=67.231.154.164
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [67.231.154.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FAF60A260A;
	Thu, 19 Nov 2026 22:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24FAF60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sitime.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=Q2vEj1kh;
	dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=wo1DZyvA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sitime.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=mail; bh=Dz2jiH/aVVCVAwAB2BHKIhTJchtjXu6f+nwQ7XFMGQk=;
 b=Q2vEj1khmtPeX+cEGeq0KsIA9JeK5DoNyuTue5DFIF2m0H6JpaK8NgZbY866ISFckxWQw8rwFx2lP19uWnJ4We0oLwCOhPa1pS1bvyD/u7iTgmvOaFCYGebYWcBMw1i9wNDZfzP+1D+YhWrBsSl1oQ6WDowq/JrokqNcRPvHfDrzPgd7+B6xZ48UlmmzondKLwP30rri+Vk0/eFH5+FYBMCpdeMvLS6CRC+fbZsRcQJ40ts4Bc+0qhZlOWw0kLIKIPjZ1agIYYLMV4kpVjvpreEfdF0GcjdSsyZqMFjJcFb0RvEYi58Qrpv37kYrAHtiw6iRnvY7s3a9s7HJJoikqA==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11022077.outbound.protection.outlook.com [52.101.53.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 1FA2390007F;
	Thu, 19 Nov 2026 22:57:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XwZY4xLUNcvUYC5p393mLZKmxl93Jv0/L7kAHmEjOqcowKfLpGNhFrzE5y4KrxhggV//MCbL12Wi8mQ6Fx6ir41MWKSt6dBQ8keVdMswkphutil2guil8v1T7m8/FZlibSgXPZCs71kw2alI+59HnSvm+BFEetCuoovrErhI++y0OyB8G4BfeqwJXErpNbyh9T8h/BevKomrPBTD+nov0lC8ekliVzJ/9JVUCiK5ymFyXPdAPbplQYcJYyj5lj0rNUw1elO/2sWc1n4MAhUgtKKj/DZp84Zbfo6wN51w5MI1rM3XpMrRn7LywW+YV2nfBZOifiYD7GlqIkqNJTfTnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dz2jiH/aVVCVAwAB2BHKIhTJchtjXu6f+nwQ7XFMGQk=;
 b=CzRKdmeTuZpMm2mcO+x8ERZf+wDnvO7QBjZ6sYf8ljGfjz3ZjBivI4LMCRxvvWABwRyI6XoC4/4CJUsxh6ltXBcA3I09YfH47QwB94H7QpaAscr1o2K9764oVKC5ZoNzaoJ0hbQNljdCFx+RmBwZaqc0X5YTc2DPEYbuGQT5fwxMPcTfWTxNG5GxQEGsUBUeZEIfBbBfxiatvFnl81D5LV+EpUTnalJ9uk/7URCwKLO3HUpmOOqYebhx4a1EEn3U5y0qXPBfRNpnWeEwS6llbGG7FkLfP2LODscya+newgdOBavfJnp+07I9Nymlc8ltkKzSEnU28NohYH4EKIOw/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sitime.com; dmarc=pass action=none header.from=sitime.com;
 dkim=pass header.d=sitime.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sitime.onmicrosoft.com; s=selector1-Sitime-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dz2jiH/aVVCVAwAB2BHKIhTJchtjXu6f+nwQ7XFMGQk=;
 b=wo1DZyvAhhMLt/6ZhPKUyJCz3YGT99hUjWb2hwDc87Lkgxx8Z3T521QPFYlnqflKWRBgvninn1OJikuuFdSn7AR7D4OKftiNgBfjrBoXfntHcCwh1DgLSUs+9MF8f8WnbnEfROyDgPJhDOF9LUXDyCr59jr1q0RO+7iCh3Y6tGgmjgNiF/EnJqJSpynKBwgQMCQe4NcFETZ8cHtChZtgN+fH7QOSCdBi78gDsEMC/eyJOxLfHVgtX2wpfYyfQQemw0cw8rannTZfX3P13AvjkeNqlk3V+/30HJH+5D7ZnPqEdPfO7b3kTZWcaK92xbcnEjBpDM9QzHmxD2u37KKxYw==
Received: from DSVPR20MB994924.namprd20.prod.outlook.com (2603:10b6:8:45b::22)
 by PH0PR20MB4352.namprd20.prod.outlook.com (2603:10b6:510:14d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 22:57:57 +0000
Received: from DSVPR20MB994924.namprd20.prod.outlook.com
 ([fe80::5f15:fc8a:498:98d7]) by DSVPR20MB994924.namprd20.prod.outlook.com
 ([fe80::5f15:fc8a:498:98d7%6]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 22:57:57 +0000
From: Ali Rouhi <arouhi@sitime.com>
To: "jiri@resnulli.us" <jiri@resnulli.us>
CC: "vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>,
	"arkadiusz.kubalewski@intel.com" <arkadiusz.kubalewski@intel.com>,
	"ivecera@redhat.com" <ivecera@redhat.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "cjubran@nvidia.com"
	<cjubran@nvidia.com>, "Oleg.Zadorozhnyi@devoxsoftware.com"
	<Oleg.Zadorozhnyi@devoxsoftware.com>,
	"prabhakar.mahadev-lad.rj@bp.renesas.com"
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH net-next v16 05/13] dpll: sit9531x: read DPLL types and pin
 properties from system firmware
Thread-Topic: [PATCH net-next v16 05/13] dpll: sit9531x: read DPLL types and
 pin properties from system firmware
Thread-Index: AQHdeHlqdsP0RAi1bUqMZSJ2TRgoZw==
Date: Thu, 19 Nov 2026 22:57:56 +0000
Message-ID: <20261119225752.41846-6-arouhi@sitime.com>
References: <20261119225752.41846-1-arouhi@sitime.com>
In-Reply-To: <20261119225752.41846-1-arouhi@sitime.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sitime.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DSVPR20MB994924:EE_|PH0PR20MB4352:EE_
x-ms-office365-filtering-correlation-id: aeb8fa79-b770-4594-c729-08df46908db1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|18002099003|261009220027099003|261009223027099003|261009223327099003|261009221727099003|261009221227099003|22082099003|3023799007|260925021911599003|260925021311599003|56012099006|260925022911599003|5023799004|261102123227099003|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 nenODN5pYjBgDX9tPR/3a87/XDNU/LcaoEt9do5mnjjbIwETEgyVVwqElnlAdYUhtaokGuiq504LWR9kOAnfpFb8wu0RuQ9gwTgA4oY1VGfyhatyEp/CrbV8T+SXHXw/jXDtPh8IaGZ7Zqhp+GSJvCQKr11MMi02apFnL3KkmnAju1pYZFTzulElte1kB4uQOoHrWVfsLkL5ezH1PQZv1O+s9NeDW7/uHglMK/BpLkY9UTDjTEnbvF/kRbxUVo+GGl6SdAGBHxos+9Qp+2/+zwLnuYFK9MsI+JvzwYhV2YmEILitD8Qja5gQeRgHOq+COuKTzQQE+3HDjzC1s6AuA5BmWpq1XQRTDOqvocWQIsP6Qjg9QnqGcFekZ0W/YXjQAO9yCSdeJYlqnTJvlwJdjpKBf9zd7knUVuBvkGz7eQKwFdO42dKt5dUTXKwmtQGEMyTetCUH75S6/avPk6X09jw5zYxXM40RomJnDtzRGGs1Z3m1uRzfsQPe+WrhDJqcX+SCkWgPxuptOGGRWcnssnOXpDyBGhtSxFdZ3CACW3uGnuawpGnzEo4eKfJ3pmN84FjgtnYjP+0o5IVKj/eRXbmXGw3R4wsZH1O9duyeiLSdPY+O7lYpTsWGedjaQsKg+ZutzMkvRTFfPk2wPFmfViL5WDVVJmt/UByKuBwBr1iFePFAl7jwrOgUKNs071XERZDl/93mzuYCHRWjkaugDO6bhVuCmm8GDg5mCPXkRvk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR20MB994924.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(18002099003)(261009220027099003)(261009223027099003)(261009223327099003)(261009221727099003)(261009221227099003)(22082099003)(3023799007)(260925021911599003)(260925021311599003)(56012099006)(260925022911599003)(5023799004)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7aG0jR/LzI8I+tc77J4tj52S0JZ3mZMPZLAjgYmAoqutWx5yCBMB7NdMLg?=
 =?iso-8859-1?Q?ogn27QzvkoNO50IaNPUQyFUAHN3d1Nx9FliVJJAhGfL6vaWr5qqRgSxXLs?=
 =?iso-8859-1?Q?Mx7F7R2A3PD5N5tzT4X/1S+BaoeR7zRwyITOOeALXHLx+FRCzBL/piuAT8?=
 =?iso-8859-1?Q?+cKiHDReinIxIw/gRc68QzIKDIGuOq7B+k0BhFfMJNJ/R595QQzfvHC7I0?=
 =?iso-8859-1?Q?AuL5xna8we1hkNpqiTBQ3DL+8YwC2YkoxgJyfVq0hbXwl3rUhW4FOml7uw?=
 =?iso-8859-1?Q?ws/c96gm2zw3gKpHFZuqZa3X38x0MwSW13SdSt7qKwmkFOs1hc5hbkXz8x?=
 =?iso-8859-1?Q?6KVGJjoBObFkDdXud7uM+/9x3mrovU2v2LNR3W2KHaDl/AHS/Tn5bFnZMD?=
 =?iso-8859-1?Q?VDTgYqxfZs2Hdb6txeS9Hm1FWkCY1Hs+CBUe0/Eh7kM0xXXhnGzB/xoeRo?=
 =?iso-8859-1?Q?WKFrQyUlAhizuJtggzOmE/tHHNu/ByELVlNLWWMlQnwuRodkGtUzQbz+Us?=
 =?iso-8859-1?Q?qjX6j04vOD+j5vaCgBJDh5HpultubYEgjoHDoJyg3XMZbjF/RbrrEHbrCu?=
 =?iso-8859-1?Q?3+jPeDy+yQ4eXW5vhSuiPzIt6OA/i7YJyIVcbLi8LlpnRE17NHbp77i6/O?=
 =?iso-8859-1?Q?Is9UXOq0eqhzvWDLGfqWkR3ISCcOk+ubdmi1hBjocScDvWiUOsn52ZdUaR?=
 =?iso-8859-1?Q?pypbzc5DMzjgq19Wi8IYowKkfAI4+qpOxNw9w1msAk1+t218lF/su6N8aw?=
 =?iso-8859-1?Q?ub4Z2YyUITmg1e6V9dPi055Nq5LMdk6NPskBtR/l0vdwt/sh7lJ87ciBX/?=
 =?iso-8859-1?Q?bzCyTdpQv3B3BBrJ0WXmtdh7e76ywE7hX4guFu6JMbfJ75d10UCoVVYMhX?=
 =?iso-8859-1?Q?WNoYpKO/cOaCa/DZuInz47zIYSc3S20oOR5Pt5DIonlttfkwcKE0zYEi2J?=
 =?iso-8859-1?Q?IGPXRSXZ2S8vWGvYQ7SzbJXjyRCVA/BuvzmCo3H2usa2FqE+GxrX7aOCSW?=
 =?iso-8859-1?Q?adVVaPndkPsblCmAdqSLFywAzdGFq4VrlcPmLCnEQnJ39bgytR8PdczVgI?=
 =?iso-8859-1?Q?It9rWLLLzCxSFQw6prUO1Boh+G5y7rOK8tdsnPn3dvEjtwpJFQqbp4JOFV?=
 =?iso-8859-1?Q?fG68yKsTg6MrG/9FT6hjMFKl8951pp6fjEP0B5bUeq4veYwuOu62qWdTT7?=
 =?iso-8859-1?Q?BjSuHTvh/2Pnncpx4zSgBrjtP+f/gXMJKhBPcolTrD1RD8F8oVsnGnG9+R?=
 =?iso-8859-1?Q?QN1uK51cmTxbLfeRwY1keftWUDFBLQZuFJTshLu4vLiZRcJS824Ei+gxfk?=
 =?iso-8859-1?Q?JMXuJxzuDi16uHXj34ZLvybWX52KNcZ6dEx74mylUgIvrz4OqBKRBZPcVj?=
 =?iso-8859-1?Q?hUvJg5HUTbi3H5TUFQFWmvbdgttgFBXuK6/xMrx1LnuFZM1K+lGe+8vjVX?=
 =?iso-8859-1?Q?gAQnDoSBZRg35E1vedkH2SymrPj4gKFWcL2XV+gqt9Ip2VRULezRhEdzRX?=
 =?iso-8859-1?Q?FyJcqtahVY96JVz10Ka1Ab6H+LUU9aBLAI8WXcWMJnQf2CFSHl8sMluXqG?=
 =?iso-8859-1?Q?aqtw8bJSxCOuWK2uBy0udbQzUu78wxyC9825cMolss+HD8lir3mE4+kL6Z?=
 =?iso-8859-1?Q?OFw2+7hmC4g8OHIIZM5O7CHTxuY1hfhxpMcRUZlYrNu4L8rIxXJYTaPhTh?=
 =?iso-8859-1?Q?Ar42E9eEFlfDGCxz5dyv++5gil9S2eC3VbZbyBF7kMQk5qokxBfnWGsAhs?=
 =?iso-8859-1?Q?rJ9xgoGdE+FL/1yqTH80sY3LaFrC2lgAzqFFaYjola0ZSk?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	TVUrU1pkvYa/xY8MDAni8kYKZhOKzqiyQjktvXxUl6p+CFVtWAHkeY4vIEJm10AR1t13LvRSqM6zfVhkpBc17o4vif8Y4w1AFV/qyBoNT8c4S1l+OOWupia7ZxXebQO3lyzedo9RjwyjPKQljoAa/855cs1ZiWxXqoZOp9CFOvD8OwFUNGM3fXpVPuhH6F+OaEpN/KpCV2w4CN2X7GS2u2mwHHgCSEISxi5FRT8/0X3hTfQN1buK4MqUyqrYDWaNJ1ulpNhPF4Dgp4I6JAEhy6OgV88jMyZKiyF1fdyPVem882RGC/4AVQLXLbm3MLbaOamKM2T8jIyvnE+MtxA0dA==
X-OriginatorOrg: sitime.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DSVPR20MB994924.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb8fa79-b770-4594-c729-08df46908db1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 22:57:56.6127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fb55916-cf10-4b0d-96f4-cf3952657263
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DWMN1x02i/GfH2sBTItdruWqJUvKK59U4NavnXBKAuT0DsvA4HblTCIRQHt21sBOF/+RO8Xx2BnR8A8k7c9R/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR20MB4352
X-MDID: 1795129079-DMFZkVa9Tg2h
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;at1;1795129079;DMFZkVa9Tg2h;<arouhi@sitime.com>;ba04557de9d2da8490f5f1e6de07b967
X-PPE-TRUSTED: V=1;DIR=OUT;

From: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>=0A=
=0A=
Read the DPLL type from the firmware node and, for each pin, its label,=0A=
connection type and supported frequencies. The direction is the=0A=
caller's and selects the sub-node; the capabilities are fixed per pin=0A=
class. A node that gives none of these gets defaults.=0A=
=0A=
Inputs are the P and N lanes of four pairs: a pair run single-ended=0A=
gives two inputs, a differential pair one. Outputs are labeled OUTn by=0A=
the driver's index, while reg stays the die slot the binding defines, so=0A=
one binding serves both variants.=0A=
=0A=
The first listed rate is used as an input's rate. An output with no=0A=
supported-frequencies-hz is advertised as a continuous range, since the=0A=
core refuses every frequency request on a pin with none.=0A=
=0A=
Signed-off-by: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>=0A=
Signed-off-by: Ali Rouhi <arouhi@sitime.com>=0A=
---=0A=
 drivers/dpll/sit9531x/Makefile |   2 +-=0A=
 drivers/dpll/sit9531x/core.h   |  56 ++++++=0A=
 drivers/dpll/sit9531x/prop.c   | 327 +++++++++++++++++++++++++++++++++=0A=
 drivers/dpll/sit9531x/prop.h   |  37 ++++=0A=
 4 files changed, 421 insertions(+), 1 deletion(-)=0A=
 create mode 100644 drivers/dpll/sit9531x/prop.c=0A=
 create mode 100644 drivers/dpll/sit9531x/prop.h=0A=
=0A=
diff --git a/drivers/dpll/sit9531x/Makefile b/drivers/dpll/sit9531x/Makefil=
e=0A=
index a221fe55386a..819af61123f5 100644=0A=
--- a/drivers/dpll/sit9531x/Makefile=0A=
+++ b/drivers/dpll/sit9531x/Makefile=0A=
@@ -1,4 +1,4 @@=0A=
 # SPDX-License-Identifier: GPL-2.0-only=0A=
 =0A=
 obj-$(CONFIG_SIT9531X_DPLL) +=3D sit9531x.o=0A=
-sit9531x-y :=3D core.o=0A=
+sit9531x-y :=3D core.o prop.o=0A=
diff --git a/drivers/dpll/sit9531x/core.h b/drivers/dpll/sit9531x/core.h=0A=
index 0f826313eff8..7a81c9b14b7f 100644=0A=
--- a/drivers/dpll/sit9531x/core.h=0A=
+++ b/drivers/dpll/sit9531x/core.h=0A=
@@ -23,7 +23,15 @@=0A=
 =0A=
 #define SIT9531X_NUM_PLLS		4=0A=
 #define SIT9531X_MAX_INPUTS		8=0A=
+#define SIT9531X_NUM_INPUT_PAIRS	(SIT9531X_MAX_INPUTS / 2)=0A=
 #define SIT9531X_MAX_OUTPUTS		12=0A=
+/*=0A=
+ * INTSYNC, the inter-PLL sync line, is two pins: an input pin on the PLL =
that=0A=
+ * locks to it, numbered after the inputs and the xtal, and an output pin =
on the=0A=
+ * PLL that drives it, numbered after the outputs.=0A=
+ */=0A=
+#define SIT9531X_INTSYNC_PIN_ID		(SIT9531X_MAX_INPUTS + 1)=0A=
+#define SIT9531X_INTSYNC_OUT_PIN_ID	SIT9531X_MAX_OUTPUTS=0A=
 =0A=
 /*=0A=
  * struct sit9531x_chip_info - chip variant identification=0A=
@@ -41,6 +49,35 @@ struct sit9531x_chip_info {=0A=
 	const u8	*clkout_map;=0A=
 };=0A=
 =0A=
+/*=0A=
+ * enum sit9531x_signal_mode - input signal electrical mode=0A=
+ * @SIT9531X_MODE_SE: single-ended=0A=
+ * @SIT9531X_MODE_DE: differential=0A=
+ */=0A=
+enum sit9531x_signal_mode {=0A=
+	SIT9531X_MODE_SE =3D 0,=0A=
+	SIT9531X_MODE_DE,=0A=
+};=0A=
+=0A=
+/*=0A=
+ * struct sit9531x_ref - input reference state=0A=
+ * @freq: configured frequency in Hz=0A=
+ * @sig_mode: signal mode of the input pair, read from CLKINx_INPUT_MODE a=
t=0A=
+ *   probe=0A=
+ */=0A=
+struct sit9531x_ref {=0A=
+	u64		freq;=0A=
+	enum sit9531x_signal_mode	sig_mode;=0A=
+};=0A=
+=0A=
+/*=0A=
+ * struct sit9531x_out - output state=0A=
+ * @freq: output frequency in Hz=0A=
+ */=0A=
+struct sit9531x_out {=0A=
+	u64		freq;=0A=
+};=0A=
+=0A=
 /*=0A=
  * struct sit9531x_dev - SiT9531x device instance=0A=
  * @dev: parent device=0A=
@@ -51,6 +88,8 @@ struct sit9531x_chip_info {=0A=
  * @page_lock: held across a page select and its transfer; nests inside=0A=
  *   @multiop_lock=0A=
  * @page: current page, -1 when unknown=0A=
+ * @ref: input reference states=0A=
+ * @out: output states=0A=
  * @xtal_freq: crystal frequency in Hz=0A=
  * @reset_gpio: optional reset line, NULL if absent=0A=
  */=0A=
@@ -65,11 +104,28 @@ struct sit9531x_dev {=0A=
 	struct mutex			page_lock;=0A=
 	int				page;=0A=
 =0A=
+	struct sit9531x_ref	ref[SIT9531X_MAX_INPUTS + 1]; /* +1 for xtal */=0A=
+	struct sit9531x_out	out[SIT9531X_MAX_OUTPUTS];=0A=
 	u32			xtal_freq;=0A=
 =0A=
 	struct gpio_desc	*reset_gpio;=0A=
 };=0A=
 =0A=
+/*=0A=
+ * Input index 2n is the P lane and 2n + 1 the N lane of pair n; index=0A=
+ * SIT9531X_MAX_INPUTS is the XO.=0A=
+ */=0A=
+=0A=
+static inline u8 sit9531x_input_pair(u8 index)=0A=
+{=0A=
+	return index >> 1;=0A=
+}=0A=
+=0A=
+static inline bool sit9531x_input_is_n(u8 index)=0A=
+{=0A=
+	return index & 1;=0A=
+}=0A=
+=0A=
 /* Register page of PLL @pll_idx (0 =3D PLLA, 3 =3D PLLD). */=0A=
 static inline u8 sit9531x_pll_page(u8 pll_idx)=0A=
 {=0A=
diff --git a/drivers/dpll/sit9531x/prop.c b/drivers/dpll/sit9531x/prop.c=0A=
new file mode 100644=0A=
index 000000000000..b9405eba49a3=0A=
--- /dev/null=0A=
+++ b/drivers/dpll/sit9531x/prop.c=0A=
@@ -0,0 +1,327 @@=0A=
+// SPDX-License-Identifier: GPL-2.0=0A=
+/*=0A=
+ * SiTime SiT9531x firmware node property parsing=0A=
+ *=0A=
+ * Copyright (C) 2026 SiTime Corp.=0A=
+ * Author: Ali Rouhi <arouhi@sitime.com>=0A=
+ * Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>=0A=
+ *=0A=
+ * Retrieves pin properties from Device Tree firmware nodes (or=0A=
+ * applies defaults when no firmware node exists).=0A=
+ */=0A=
+=0A=
+#include <linux/dev_printk.h>=0A=
+#include <linux/dpll.h>=0A=
+#include <linux/err.h>=0A=
+#include <linux/fwnode.h>=0A=
+#include <linux/property.h>=0A=
+#include <linux/slab.h>=0A=
+#include <linux/string.h>=0A=
+=0A=
+#include "core.h"=0A=
+#include "prop.h"=0A=
+=0A=
+static void sit9531x_input_pin_label(struct sit9531x_dev *sitdev,=0A=
+				     struct sit9531x_pin_props *props, u8 id)=0A=
+{=0A=
+	u8 pair =3D sit9531x_input_pair(id);=0A=
+=0A=
+	if (sitdev->ref[id].sig_mode =3D=3D SIT9531X_MODE_DE)=0A=
+		snprintf(props->package_label,=0A=
+			 sizeof(props->package_label), "IN%u", pair);=0A=
+	else=0A=
+		snprintf(props->package_label,=0A=
+			 sizeof(props->package_label), "IN%u%c", pair,=0A=
+			 sit9531x_input_is_n(id) ? 'N' : 'P');=0A=
+}=0A=
+=0A=
+/* A differential input pair is labeled IN<n>; its N lane is not registere=
d. */=0A=
+static void=0A=
+sit9531x_prop_pin_package_label_set(struct sit9531x_dev *sitdev,=0A=
+				    struct sit9531x_pin_props *props,=0A=
+				    enum dpll_pin_direction dir, u8 id)=0A=
+{=0A=
+	if (dir =3D=3D DPLL_PIN_DIRECTION_INPUT &&=0A=
+	    id =3D=3D SIT9531X_INTSYNC_PIN_ID) {=0A=
+		strscpy(props->package_label, "INTSYNC",=0A=
+			sizeof(props->package_label));=0A=
+		props->dpll_props.package_label =3D props->package_label;=0A=
+		return;=0A=
+	}=0A=
+=0A=
+	if (dir =3D=3D DPLL_PIN_DIRECTION_INPUT && id =3D=3D SIT9531X_MAX_INPUTS)=
 {=0A=
+		strscpy(props->package_label, "XO",=0A=
+			sizeof(props->package_label));=0A=
+		props->dpll_props.package_label =3D props->package_label;=0A=
+		return;=0A=
+	}=0A=
+=0A=
+	if (dir =3D=3D DPLL_PIN_DIRECTION_OUTPUT &&=0A=
+	    id =3D=3D SIT9531X_INTSYNC_OUT_PIN_ID) {=0A=
+		strscpy(props->package_label, "SYNCOUT",=0A=
+			sizeof(props->package_label));=0A=
+		props->dpll_props.package_label =3D props->package_label;=0A=
+		return;=0A=
+	}=0A=
+=0A=
+	if (dir =3D=3D DPLL_PIN_DIRECTION_INPUT)=0A=
+		sit9531x_input_pin_label(sitdev, props, id);=0A=
+	else=0A=
+		/*=0A=
+		 * Package numbering; on the SiT95317 it differs from the chip=0A=
+		 * slot that the registers and the binding's reg use.=0A=
+		 */=0A=
+		snprintf(props->package_label, sizeof(props->package_label),=0A=
+			 "OUT%u", id);=0A=
+=0A=
+	props->dpll_props.package_label =3D props->package_label;=0A=
+}=0A=
+=0A=
+/* An output's reg is the chip slot it drives, not the driver's index. */=
=0A=
+static int=0A=
+sit9531x_prop_pin_fwnode_get(struct sit9531x_dev *sitdev,=0A=
+			     struct sit9531x_pin_props *props,=0A=
+			     enum dpll_pin_direction dir, u8 id)=0A=
+{=0A=
+	struct fwnode_handle *pins_node, *pin_node;=0A=
+	const char *node_name;=0A=
+=0A=
+	if (dir =3D=3D DPLL_PIN_DIRECTION_INPUT) {=0A=
+		node_name =3D "input-pins";=0A=
+	} else {=0A=
+		node_name =3D "output-pins";=0A=
+		if (id < sitdev->info->num_outputs)=0A=
+			id =3D sitdev->info->clkout_map[id];=0A=
+	}=0A=
+=0A=
+	pins_node =3D device_get_named_child_node(sitdev->dev, node_name);=0A=
+	if (!pins_node) {=0A=
+		dev_dbg(sitdev->dev, "'%s' sub-node is missing\n", node_name);=0A=
+		return -ENOENT;=0A=
+	}=0A=
+=0A=
+	fwnode_for_each_child_node(pins_node, pin_node) {=0A=
+		u32 reg;=0A=
+=0A=
+		if (fwnode_property_read_u32(pin_node, "reg", &reg))=0A=
+			continue;=0A=
+=0A=
+		if (id =3D=3D reg)=0A=
+			break;=0A=
+	}=0A=
+=0A=
+	fwnode_handle_put(pins_node);=0A=
+=0A=
+	props->fwnode =3D pin_node;=0A=
+=0A=
+	dev_dbg(sitdev->dev, "Firmware node for %s %sfound\n",=0A=
+		props->package_label, pin_node ? "" : "NOT ");=0A=
+=0A=
+	return pin_node ? 0 : -ENOENT;=0A=
+}=0A=
+=0A=
+/* Free the result with sit9531x_pin_props_put(). */=0A=
+struct sit9531x_pin_props *=0A=
+sit9531x_pin_props_get(struct sit9531x_dev *sitdev,=0A=
+		       enum dpll_pin_direction dir, u8 index)=0A=
+{=0A=
+	bool sync_in =3D dir =3D=3D DPLL_PIN_DIRECTION_INPUT &&=0A=
+		       index =3D=3D SIT9531X_INTSYNC_PIN_ID;=0A=
+	bool sync_out =3D dir =3D=3D DPLL_PIN_DIRECTION_OUTPUT &&=0A=
+			index =3D=3D SIT9531X_INTSYNC_OUT_PIN_ID;=0A=
+	bool xo =3D dir =3D=3D DPLL_PIN_DIRECTION_INPUT &&=0A=
+		  index =3D=3D SIT9531X_MAX_INPUTS;=0A=
+	struct dpll_pin_frequency *ranges;=0A=
+	struct sit9531x_pin_props *props;=0A=
+	int i, j, num_freqs =3D 0, rc;=0A=
+	u32 *freqs =3D NULL;=0A=
+	const char *type;=0A=
+	u64 curr_freq;=0A=
+=0A=
+	props =3D kzalloc_obj(*props, GFP_KERNEL);=0A=
+	if (!props)=0A=
+		return ERR_PTR(-ENOMEM);=0A=
+=0A=
+	if (sync_in) {=0A=
+		/* INTSYNC destination: a reference the PLL can lock to. */=0A=
+		props->dpll_props.type =3D DPLL_PIN_TYPE_INT_OSCILLATOR;=0A=
+		props->dpll_props.capabilities =3D=0A=
+			DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE;=0A=
+		curr_freq =3D 0;=0A=
+	} else if (sync_out) {=0A=
+		/* INTSYNC source: driving it is not a reference selection */=0A=
+		props->dpll_props.type =3D DPLL_PIN_TYPE_INT_OSCILLATOR;=0A=
+		props->dpll_props.capabilities =3D=0A=
+			DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE;=0A=
+		curr_freq =3D 0;=0A=
+	} else if (xo) {=0A=
+		props->dpll_props.type =3D DPLL_PIN_TYPE_INT_OSCILLATOR;=0A=
+		props->dpll_props.capabilities =3D 0;=0A=
+		curr_freq =3D sitdev->xtal_freq;=0A=
+	} else if (dir =3D=3D DPLL_PIN_DIRECTION_INPUT) {=0A=
+		props->dpll_props.type =3D DPLL_PIN_TYPE_EXT;=0A=
+		props->dpll_props.capabilities =3D=0A=
+			DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE;=0A=
+		curr_freq =3D sitdev->ref[index].freq;=0A=
+	} else {=0A=
+		props->dpll_props.type =3D DPLL_PIN_TYPE_EXT;=0A=
+		props->dpll_props.capabilities =3D=0A=
+			DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE;=0A=
+		curr_freq =3D 0;=0A=
+	}=0A=
+=0A=
+	sit9531x_prop_pin_package_label_set(sitdev, props, dir, index);=0A=
+=0A=
+	/* Internal pins take no properties from the firmware node. */=0A=
+	if (sync_in || sync_out || xo)=0A=
+		goto skip_fwnode_props;=0A=
+=0A=
+	rc =3D sit9531x_prop_pin_fwnode_get(sitdev, props, dir, index);=0A=
+	if (rc)=0A=
+		goto skip_fwnode_props;=0A=
+=0A=
+	fwnode_property_read_string(props->fwnode, "label",=0A=
+				    &props->dpll_props.board_label);=0A=
+=0A=
+	if (!fwnode_property_read_string(props->fwnode, "connection-type",=0A=
+					 &type)) {=0A=
+		if (!strcmp(type, "ext"))=0A=
+			props->dpll_props.type =3D DPLL_PIN_TYPE_EXT;=0A=
+		else if (!strcmp(type, "gnss"))=0A=
+			props->dpll_props.type =3D DPLL_PIN_TYPE_GNSS;=0A=
+		else if (!strcmp(type, "int"))=0A=
+			props->dpll_props.type =3D DPLL_PIN_TYPE_INT_OSCILLATOR;=0A=
+		else if (!strcmp(type, "synce"))=0A=
+			props->dpll_props.type =3D DPLL_PIN_TYPE_SYNCE_ETH_PORT;=0A=
+		else if (!strcmp(type, "mux"))=0A=
+			props->dpll_props.type =3D DPLL_PIN_TYPE_MUX;=0A=
+		else=0A=
+			dev_warn(sitdev->dev,=0A=
+				 "Unknown pin type '%s'\n", type);=0A=
+	}=0A=
+=0A=
+	if (!fwnode_property_present(props->fwnode,=0A=
+				     "supported-frequencies-hz"))=0A=
+		goto skip_fwnode_props;=0A=
+=0A=
+	/* A -hz property is 32-bit; no rate of this part needs more. */=0A=
+	num_freqs =3D fwnode_property_count_u32(props->fwnode,=0A=
+					      "supported-frequencies-hz");=0A=
+	if (num_freqs <=3D 0) {=0A=
+		rc =3D num_freqs ? num_freqs : -EINVAL;=0A=
+		dev_err(sitdev->dev,=0A=
+			"malformed supported-frequencies-hz for %s: %d\n",=0A=
+			props->package_label, rc);=0A=
+		goto err_alloc_freqs;=0A=
+	}=0A=
+=0A=
+	freqs =3D kcalloc(num_freqs, sizeof(*freqs), GFP_KERNEL);=0A=
+	if (!freqs) {=0A=
+		rc =3D -ENOMEM;=0A=
+		goto err_alloc_freqs;=0A=
+	}=0A=
+=0A=
+	rc =3D fwnode_property_read_u32_array(props->fwnode,=0A=
+					    "supported-frequencies-hz",=0A=
+					    freqs, num_freqs);=0A=
+	if (rc) {=0A=
+		dev_warn(sitdev->dev,=0A=
+			 "failed to parse supported-frequencies-hz for %s: %d\n",=0A=
+			 props->package_label, rc);=0A=
+		goto err_alloc_ranges;=0A=
+	}=0A=
+=0A=
+	/* The first listed rate seeds the input's rate */=0A=
+	if (num_freqs > 0 && dir =3D=3D DPLL_PIN_DIRECTION_INPUT && !xo)=0A=
+		curr_freq =3D freqs[0];=0A=
+=0A=
+skip_fwnode_props:=0A=
+	if (sync_in || sync_out)=0A=
+		return props;=0A=
+=0A=
+	/*=0A=
+	 * An output with no listed rates gets one wide range, as the setter=0A=
+	 * checks Fvco/N; the XO gets its one rate.=0A=
+	 */=0A=
+	ranges =3D kcalloc(num_freqs + 1, sizeof(*ranges), GFP_KERNEL);=0A=
+	if (!ranges) {=0A=
+		rc =3D -ENOMEM;=0A=
+		goto err_alloc_ranges;=0A=
+	}=0A=
+=0A=
+	/* Set after the last allocation that can fail */=0A=
+	if (curr_freq && dir =3D=3D DPLL_PIN_DIRECTION_INPUT)=0A=
+		sitdev->ref[index].freq =3D curr_freq;=0A=
+=0A=
+	j =3D 0;=0A=
+=0A=
+	for (i =3D 0; i < num_freqs; i++) {=0A=
+		struct dpll_pin_frequency freq =3D DPLL_PIN_FREQUENCY(freqs[i]);=0A=
+=0A=
+		ranges[j++] =3D freq;=0A=
+	}=0A=
+=0A=
+	if (!num_freqs && dir =3D=3D DPLL_PIN_DIRECTION_OUTPUT) {=0A=
+		ranges[j].min =3D 1;=0A=
+		ranges[j].max =3D 1000000000ULL; /* 1 GHz */=0A=
+		j++;=0A=
+	} else if (!num_freqs && curr_freq) {=0A=
+		struct dpll_pin_frequency f =3D DPLL_PIN_FREQUENCY(curr_freq);=0A=
+=0A=
+		ranges[j++] =3D f;=0A=
+	}=0A=
+=0A=
+	if (j > 0) {=0A=
+		props->dpll_props.freq_supported =3D ranges;=0A=
+		props->dpll_props.freq_supported_num =3D j;=0A=
+	} else {=0A=
+		kfree(ranges);=0A=
+		props->dpll_props.freq_supported =3D NULL;=0A=
+		props->dpll_props.freq_supported_num =3D 0;=0A=
+	}=0A=
+=0A=
+	kfree(freqs);=0A=
+=0A=
+	return props;=0A=
+=0A=
+err_alloc_ranges:=0A=
+	kfree(freqs);=0A=
+err_alloc_freqs:=0A=
+	fwnode_handle_put(props->fwnode);=0A=
+	kfree(props);=0A=
+=0A=
+	return ERR_PTR(rc);=0A=
+}=0A=
+=0A=
+void sit9531x_pin_props_put(struct sit9531x_pin_props *props)=0A=
+{=0A=
+	kfree(props->dpll_props.freq_supported);=0A=
+=0A=
+	if (props->fwnode)=0A=
+		fwnode_handle_put(props->fwnode);=0A=
+=0A=
+	kfree(props);=0A=
+}=0A=
+=0A=
+enum dpll_type=0A=
+sit9531x_prop_dpll_type_get(struct sit9531x_dev *sitdev, u8 index)=0A=
+{=0A=
+	const char *types[SIT9531X_NUM_PLLS];=0A=
+	int count;=0A=
+=0A=
+	count =3D device_property_read_string_array(sitdev->dev, "dpll-types",=0A=
+						  types, ARRAY_SIZE(types));=0A=
+=0A=
+	if (index >=3D count || !types[index])=0A=
+		return DPLL_TYPE_PPS;=0A=
+=0A=
+	if (!strcmp(types[index], "pps"))=0A=
+		return DPLL_TYPE_PPS;=0A=
+	else if (!strcmp(types[index], "eec"))=0A=
+		return DPLL_TYPE_EEC;=0A=
+=0A=
+	dev_warn(sitdev->dev, "Unknown DPLL type '%s', using default\n",=0A=
+		 types[index]);=0A=
+=0A=
+	return DPLL_TYPE_PPS;=0A=
+}=0A=
diff --git a/drivers/dpll/sit9531x/prop.h b/drivers/dpll/sit9531x/prop.h=0A=
new file mode 100644=0A=
index 000000000000..b16db0bc51c6=0A=
--- /dev/null=0A=
+++ b/drivers/dpll/sit9531x/prop.h=0A=
@@ -0,0 +1,37 @@=0A=
+/* SPDX-License-Identifier: GPL-2.0 */=0A=
+/*=0A=
+ * SiTime SiT9531x firmware node property parsing=0A=
+ *=0A=
+ * Copyright (C) 2026 SiTime Corp.=0A=
+ * Author: Ali Rouhi <arouhi@sitime.com>=0A=
+ * Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>=0A=
+ */=0A=
+=0A=
+#ifndef _SIT9531X_PROP_H=0A=
+#define _SIT9531X_PROP_H=0A=
+=0A=
+#include <linux/dpll.h>=0A=
+#include <linux/fwnode.h>=0A=
+=0A=
+struct sit9531x_dev;=0A=
+=0A=
+/*=0A=
+ * struct sit9531x_pin_props - pin properties from firmware=0A=
+ * @fwnode: firmware node handle, NULL if no DT node=0A=
+ * @dpll_props: DPLL core pin properties=0A=
+ * @package_label: pin package label (e.g. "IN0", "OUT3")=0A=
+ */=0A=
+struct sit9531x_pin_props {=0A=
+	struct fwnode_handle		*fwnode;=0A=
+	struct dpll_pin_properties	dpll_props;=0A=
+	char				package_label[8];=0A=
+};=0A=
+=0A=
+enum dpll_type sit9531x_prop_dpll_type_get(struct sit9531x_dev *sitdev,=0A=
+					   u8 index);=0A=
+struct sit9531x_pin_props *sit9531x_pin_props_get(struct sit9531x_dev *sit=
dev,=0A=
+						  enum dpll_pin_direction dir,=0A=
+						  u8 index);=0A=
+void sit9531x_pin_props_put(struct sit9531x_pin_props *props);=0A=
+=0A=
+#endif /* _SIT9531X_PROP_H */=0A=
-- =0A=
2.39.2 (Apple Git-143)=0A=
=0A=
