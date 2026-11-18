Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.153.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795033713;
	b=h1xz7W+q3G4yWcL3b/c4g1Ca9A38EMCx44wjnXIyZwCB1a5Ig3risjWCr218jzX+IQsm
	 ULikELVHT8ZXn7a1iyEpNXkNGN2qxkHGpKbi47FaoslsFdNdAPI6hm5qyLQkZ3ooRLixU
	 NK8L8a7STMo3U5E7lyC3YhjWVmfvNLFQkXEeTbjY4i/sCW3yOYEF2XpsnjdprbEfH7pAK
	 OGh60tsEGsyckbu2xQKCVcDzKANuUIa4+KVGW6O3rfX3wdSGy0fsQjKsNE4p8MlNdamsT
	 9MCP6yXJi0kLJ9VUkqu/uwtwsaTNa111YQpOGszg4xAt4kdVUsulOhBR7/nBqviV6mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033713;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Language:Content-Type:Content-Transfer-Encoding;
	bh=uHBU3yYSuG9iTAXXkXup+wxzPGVsyIapQzC/xJFEalw=;
	b=0DqXaDHFQBDwl2Hk9R5x2rcDeLtYldzPWCtbNgeX0VXqUssLt6ca2xETOhFRsbUS6GdH
	 n9sSZKGT2KY9IEH6C+AQ7pQy95upu1zl0MI/kgT0s2DQ9AXjrDYlMv35GsqO2/Nu0BAf5
	 y0W6zaMuIXUvrHpnZRsfoQfXrrjQoLyhfj/N/v1aQaPXxhfusWejj88oUCvtlYQivVjP3
	 4YdfHj/3p1pPTRfOT3FCjPr/juBj20aY6dnLSuhu8gUedIyKClHKa4rUXSq/QKttUyuOW
	 t5t6koGXhg/3FOurTZZp4k0HMxZqt8P9ORC0A/fyLrm1cJvOxax32pbqygftQpZWQKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=onsemi.com;
	spf=pass smtp.mailfrom=onsemi.com;
	dkim=pass header.d=onsemi.com header.i=@onsemi.com header.a=rsa-sha256 header.s=mimecast20250127 header.b=IVlSdirL;
	arc=none smtp.remote-ip=170.10.153.120
Received: from usb-smtp-delivery-120.mimecast.com (usb-smtp-delivery-120.mimecast.com [170.10.153.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE804606A331
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 20:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE804606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onsemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onsemi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=onsemi.com header.i=@onsemi.com header.a=rsa-sha256 header.s=mimecast20250127 header.b=IVlSdirL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onsemi.com;
	s=mimecast20250127; t=1795033706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uHBU3yYSuG9iTAXXkXup+wxzPGVsyIapQzC/xJFEalw=;
	b=IVlSdirLRhKjPhfR0vGhblrhGSwUxUS76SKDtrxfNIEUG+/6+J82ue/L1j73nBg6q7hARW
	pCAAJ5uVlVhAg5q4RZMmSAamWF2FBzY8ehPXcokMWnd2wNe5utMdQHlMVF1NWol5ZoY/sO
	NIpDzXsmsPqTZ/qqNjWGp7BioXAdmtv0Mk0Iw3zR6y5ba2vjjV/aA+L2xErrlwcNmsna59
	gStoYK+/o3yRQQfDDCAvmpW/TbofKKWbx+M0eopLnXCrgo6+LkavXN76uJ7tE0xeKZ555W
	kmbKSKQVsqzkr1vOLQ+HkwFm9nApcwvdf3Ys5QkbpJSzTise5aUlJQUrx95TwA==
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011013.outbound.protection.outlook.com [52.101.52.13]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id usb-mta-82-5i5lWUokOHSvHxEgqLR6mg-1; Wed,
 18 Nov 2026 12:28:13 -0800
X-MC-Unique: 5i5lWUokOHSvHxEgqLR6mg-1
X-Mimecast-MFC-AGG-ID: 5i5lWUokOHSvHxEgqLR6mg_1795033685
Received: from CH0PR02MB7867.namprd02.prod.outlook.com (2603:10b6:610:110::22)
 by SA0PR02MB7404.namprd02.prod.outlook.com (2603:10b6:806:ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 20:28:02 +0000
Received: from CH0PR02MB7867.namprd02.prod.outlook.com
 ([fe80::d722:d686:a9cb:6c2e]) by CH0PR02MB7867.namprd02.prod.outlook.com
 ([fe80::d722:d686:a9cb:6c2e%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 20:28:02 +0000
From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
To: "netdev-bot+sashiko@kernel.org" <netdev-bot+sashiko@kernel.org>
CC: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "parthiban.veerasooran@microchip.com"
	<parthiban.veerasooran@microchip.com>, "horms@kernel.org" <horms@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>, "skhan@linuxfoundation.org"
	<skhan@linuxfoundation.org>, "rdunlap@infradead.org" <rdunlap@infradead.org>,
	"richardcochran@gmail.com" <richardcochran@gmail.com>, "andrew@lunn.ch"
	<andrew@lunn.ch>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, "edumazet@kernel.org"
	<edumazet@kernel.org>, "piergiorgio.beruto@gmail.com"
	<piergiorgio.beruto@gmail.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "jerry.ray@microchip.com"
	<jerry.ray@microchip.com>, "ciprian.regus@analog.com"
	<ciprian.regus@analog.com>
Subject: RE: [PATCH net-next v11 07/14] net: ethernet: oa_tc6: Support for
 hardware timestamp
Thread-Topic: [PATCH net-next v11 07/14] net: ethernet: oa_tc6: Support for
 hardware timestamp
Thread-Index: AQHddIudbykGGBTBV0CoAc129BSOercysWoAgAGY4UA=
Date: Wed, 18 Nov 2026 20:28:02 +0000
Message-ID: <CH0PR02MB7867D78C743B178909BD5C50837A2@CH0PR02MB7867.namprd02.prod.outlook.com>
References: <20261113-s2500-mac-phy-support-v11-7-7a186141952c@onsemi.com>
 <179494518211.3136.1021105568968534363@kernel.org>
In-Reply-To: <179494518211.3136.1021105568968534363@kernel.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR02MB7867:EE_|SA0PR02MB7404:EE_
x-ms-office365-filtering-correlation-id: 7feafb78-ce3b-4651-9eb3-08df45b2718e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|22082099003|18002099003|261009223027099003|4143699003|56012099006|11063799006|261026121527099003|261028144727099003|261022115727099003|261026140227099003|261022105027099003|38070700021|10067099003
x-microsoft-antispam-message-info: LWzMBW3OvzTzPZ0Qhc1G3bk17X+SF94CdYdR8c7svQuvuUnIsj89j/VgYbrsblrmE3OhFhHfpIL6m86SXq2ENYVD4/yEcWtUXkLAPSrFS5vS6l78lbQIkhBGVcVrLeovWOGDxlFFJBTKPlmGOxmBtltjl3N8h4z0RDGNh6DcRz4fz+n6lDavagQMhK55GUs54BsEX95YIqGmICszkZWMTsXFvrnLGPst4X2kX9JQ3Rn+9KAFg7gF1iOS2mfRf+o3oZozvF8qOUokbgMUSjlYgWLcubGL+gPHji/bPMU54SnOqz/PT5m9+ew0tehH7GokC2R7Y+ts96EA1iOsjHhy77YjVrSLngALYVxje8lYs2kBiVbFIZ9y0TqMyuJRPNnXkYYzQXTUbE9C3eWicX/wq+MvYO9MkFhtURJirE2IfB1sANQid7kOCMTfDyi2luacKhX9khkJ7dYXwn/09xELfLRXizCjNNdtK10F+M2vKlKGw9jjGDjsJLfcAO25u122qCeD4u8lM1YD+T32zFhATas5QF0VzVVthdT0PlwHbml6/xcMrGyla4dVq2Pzj1qOsXi/yJmKs4TLj+VPJzN2e78u0hvxyNqre44F3LL6oEtJEL6WMeqi/3Ag31a2LgLEbAGQxPpNgENyJf637+CiaUdfpEaz58bbIJGiPsz1/Gk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR02MB7867.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(4143699003)(56012099006)(11063799006)(261026121527099003)(261028144727099003)(261022115727099003)(261026140227099003)(261022105027099003)(38070700021)(10067099003);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXI3eENrbjhRWGZLcU1qb1YxUitiUldDQm9aYTZPNUhKZm5zVGZmRnVTSkoz?=
 =?utf-8?B?cjBUdk5ZVHY2SFFTRnRENng2QkZ3bCtCYStCaDd6KzFvemhHM3N2WFptOWRR?=
 =?utf-8?B?a3lHK1VPTi9WRVBrbmI5V1VRVkNOLzlsRTREV3pEaHd1OGxkTFY3M0VlWDVp?=
 =?utf-8?B?c1RGUWk3SXJOMnQ2UlBqRzN1Rm85RUM2YVRyTk9YQU1CYkNBU1JIUmQvTlVW?=
 =?utf-8?B?MjVhNyt2VmtldTJCVmY1S0xmOFl2VEwxaWZLd0xTYUoxN2oxN1BFRU1wSWhC?=
 =?utf-8?B?R0hqcXhBc0xwOWh0ZXN6WlZoVFNqbTg5UW80Ty9vVzVkOEMwM3JHZWk0aXNS?=
 =?utf-8?B?SVI4Kzl5OUNuUlhSek5FQVVaQ0lXK0tXbU9xWE5XNlByUnVJcnRINTBSWUdR?=
 =?utf-8?B?YzM4Nld1MkRZWjRjb0dWalNmZXgwdUhNNmtKOHZsc2hVaFhzbkFpekczaEdl?=
 =?utf-8?B?eWRWSVNpeDNjc0pLczV6NnhJUFl6dEZGYkc5cGw1Tk9uSkdPQStNOGtDeGFJ?=
 =?utf-8?B?cFJhWWNINHJDdDFXU3RYTnJSTGk1S09OdkgwSnhmUFhXVTFZK1dvcG5XNFhZ?=
 =?utf-8?B?UW4wNXhlN0RFcUNkSFVxRjh5QlJjdmovdERoeVZYcEg2ZlMwdG9RTHZReDdH?=
 =?utf-8?B?VTIyZmpQMUFHa2oxUUhjbnlYSFpQOWVPbjVCRFFaeHFTQjJiS3czVE9EQWY0?=
 =?utf-8?B?dHpNbXArRUdmSUt0WEZxVzFxMjhBd2oyWjI4U2R0Y3MyYzg3TFQySThVRkhJ?=
 =?utf-8?B?NktUVnZ3aS92YzBSTHFvSmJ4OVpCeHJWQmJqUkJCOURwMGVTUXJYejczZE1S?=
 =?utf-8?B?S3Boem9kYnpadmY2dmVNM1djTDQvdE1Hc09GU0JhVnh2QWdLRlU2c0tveEpz?=
 =?utf-8?B?U2pYa05JdWRkZTR4SzA0WHVPR1NOdEs5YWdlWlAxbUJuMUtiYzlaVzlybm84?=
 =?utf-8?B?MmMyNG9JbjRMNlZHQXFTRDJzS0dpSkQrTUI3RGQyMVN6VGJmeDRKbkhncllh?=
 =?utf-8?B?TU0yb1NZU1QzMUozTEdNTXFOaW9xamNoVld6aTY2OXFjU3M3VGY4TTJoeXlX?=
 =?utf-8?B?SmRhSmpYZGxLVWlieWRPSkpJb2ZENGFlc0N2L2V4THdIZG1tOWw0WENSclZm?=
 =?utf-8?B?M2ZRZmM4U01od3hQZGJYd1NQZVIzYTg2NTJrT0QwWW5rSHdTZmNRZFFZUGhB?=
 =?utf-8?B?SEg1R0E5bmFoczlLVzQ2Y0E0SHcxakhZdUk1WHFhZ0s2NldPNmROZmlUMU1C?=
 =?utf-8?B?SjB4aUpHY05mU1RCbUVUUWlBcXlHRVRMOUN1RjBWZ1FIWjUyc3dsZERyU0Na?=
 =?utf-8?B?cVREN21ZV0RyMUsrakJYQXBOb3JqRGQ0M0ZmdU9xVnh5ZXNnYzcrVlNrOFE2?=
 =?utf-8?B?RHdnVWk5NU02SURqVmp6a1M3bzQxWXBNNEhTZU1uY3o3bjVOZzltK0xKaXdh?=
 =?utf-8?B?YlNhWDg3SDB2cHFDdXJYSVMrSHBjWDZhT1d6NGIvclI5ZFdzUnFjR1RuVnBI?=
 =?utf-8?B?bS9GeVJqdkFsMHVQU3ZLNmM3aFE2WlpIeldoZ3FsNGFjYWJ5bGVWQW9yMkEz?=
 =?utf-8?B?SVI5YUNITXNRL0tlNmZSTFhBeGJXdGJGbEtHMHlWSTRuK3hWTlFtM0lOY3U0?=
 =?utf-8?B?T3QzSHE1bEN3Y0pYbzFPSTF4VWtPUnBaY0lZTVR0UEx0NkZlWVFZYTA1eWNJ?=
 =?utf-8?B?M05xell4U1lFR2ZxNG13Y3g2aEdydHp0R1VFNnpydXYyZEMyTlpTZWVHVnNj?=
 =?utf-8?B?OXZKRzdSTmV4Mjg1cnNabmhiWlBPOXhyZVNnMm52MVVpZ0NiQmFVanR6Qy9V?=
 =?utf-8?B?Q3VSczVNVDZRdWgyZTFqTzlRM2NHdENKMkNzSjNKVnNkSmlZVFVFSkRTNW51?=
 =?utf-8?B?OWVqRkIwZUFWUklRZloxWTI4Ry8zM0hYbFpRMTN5dEF4OXYzK0NoUTRSUExz?=
 =?utf-8?B?eXRBdXdpR1ZKeUpuQ2g0dndXUTMwT083VC85VHlTUEZnVFZFWVVxR2FKL1NQ?=
 =?utf-8?B?WkdjZ0ZxRTI2dXlrOStIMU9zNUxIVGEvZjhLZXkxOVA3bnlWWldQbWlQYjhr?=
 =?utf-8?B?bUdyOWJ5QUQrck80dlJLTitzNGdVQUNNNmdkQnBtSnEvT29MTWxYS2ZFK2VZ?=
 =?utf-8?B?Rmx6Tm9BdWFvdldOMUNYczU4OGNjRDB1V1NwUnZQejI2ckFWVW9FcEMwNFRG?=
 =?utf-8?B?YnA3VHE1a0hKOGEwNnFEYjhiNGQyMnVPT3RyeFVxNm0yRlp2L3VmYlFlcGNG?=
 =?utf-8?B?RGoxQkFuaTlBWGE0dytlMWdGM2E4aytLaWRKV1ZraGxBVGdqUDVUc1l1aDdl?=
 =?utf-8?B?KzV0ZW5xcG8wR0FTeCtrQmdqZVV0czFTV1Z3YkFFU1A5Y3NncnQvakF5RVZY?=
 =?utf-8?Q?VXCq6QzLvt77Nz2Y=3D?=
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Xl3JwDiT8L0SMQ2dthCPc61kPgXvrsCHhg6aMjeEiSxrPy2gRiA77sbvxAwY/7CbBX6wS3VOirMAM8LbQBibdUz0vpiQqkduTYuHcx6qx/bVNVQe9Z+D3pTjBELDdg/q1MKZvkIRgBKduDrDmvtFtpwZo5dsROm0isDs772nc9EkJNnsOCM/OIDXaSMXrO/WJysS2dV5hPrX08qnNR6sqYQvOrcHaxOtR2Q1kAOqaOQoXso0EE0W00qvJDVJjnLWVnYmH7ii9fmaEC0J+Ycpk3IPZtL5bg0/8fYRVnoeG6OPKkFvC1zsvog1f7SAmIdhwmB5gvlCkWgExjrDp4NDow==
X-OriginatorOrg: onsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB7867.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7feafb78-ce3b-4651-9eb3-08df45b2718e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 20:28:02.0718
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 04e1674b-7af5-4d13-a082-64fc6e42384c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E/z/WfBLcMNB4ZcpWKfO3Q/RDfQCN1S86UWpf+iQH1k3Av6kKvMH4ulWinYw/yJH3aIw0hxigX0pmkGChL/137VJqvQJ07fk7+fN19/saVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7404
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aKUNt7Jx_dXwnKjkGzpqKJg4YuwhyKuTP0bNtNlOJwA_1795033685
X-Mimecast-Originator: onsemi.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBuZXRkZXYtYm90K3Nhc2hpa29A
a2VybmVsLm9yZyA8bmV0ZGV2LWJvdCtzYXNoaWtvQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNk
YXksIE5vdmVtYmVyIDE3LCAyMDI2IDExOjUzIEFNDQo+IFRvOiBTZWx2YW1hbmkgUmFqYWdvcGFs
IDxTZWx2YW1hbmkuUmFqYWdvcGFsQG9uc2VtaS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
bmV0LW5leHQgdjExIDA3LzE0XSBuZXQ6IGV0aGVybmV0OiBvYV90YzY6IFN1cHBvcnQgZm9yIGhh
cmR3YXJlDQo+IHRpbWVzdGFtcA0KPiANCj4gDQogDQo+IFtTZXZlcml0eTogTWVkaXVtXQ0KPiBD
YW4gYWxsIHRocmVlIFRUU0Mgc2xvdHMgZ2V0IHN0dWNrIHNvIHRoYXQgZXZlcnkgdGltZXN0YW1w
ZWQgZnJhbWUgZW5kcw0KPiB1cCBoZXJlPw0KPiANCj4gU3VwcG9zZSB0aGUgTUFDLVBIWSBuZXZl
ciByZXBvcnRzIHRoZSBjYXB0dXJlIGZvciBhIGZyYW1lIHRoYXQgY2FycmllZCBhDQo+IFRTQyBy
ZXF1ZXN0LiBFeGFtcGxlcyBhcmUgYSBmcmFtZSBkaXNjYXJkZWQgd2hlbiBNQUMgVFhFTiBpcyBj
bGVhcmVkIHdoaWxlDQoNCg0KV2UgYXJlIGFkZGluZyBuZXRkZXZfbm90aWZpZXIgY2FsbGJhY2sg
dG8gZG8gdGhlIGNsZWFuIHVwIHdoZW4gVFhFTiBpcyBjbGVhcmVkLg0KSSB3b3VsZCBpbWFnaW5l
IFRYRU4gd291bGQgYmUgY2xlYXJlZCBvbiBkZXZpY2UgY2xvc2Ugd2hlcmUgbmV0ZGV2IHdvdWxk
IGJlDQpNYXJrZWQgZG93bi4gQW55IGNhcHR1cmUgZXZlbnRzIHRoYXQgY29tZSBsYXRlciB3b3Vs
ZCBiZSB0YWtlbiBjYXJlIHRvby4NCg0KDQo+IA0KPiBUaGVyZSBpcyBhIHNlcGFyYXRlIHByb2Js
ZW0gd2l0aCBkcm9wcGluZyB0aGUgZnJhbWUgaW5zdGVhZCBvZiBzZW5kaW5nIGl0DQo+IHdpdGhv
dXQgYSB0aW1lc3RhbXA6IGFueSBsb2NhbCBzb2NrZXQgY2FuIHVzZSB1cCB0aGUgc2xvdHMuIE9u
Y2UNCg0KPiBIV1RTVEFNUF9UWF9PTiBpcyBlbmFibGVkLCBTT0ZfVElNRVNUQU1QSU5HX1RYX0hB
UkRXQVJFIG5lZWRzIG5vDQo+IGNhcGFiaWxpdHkuIEEgc29ja2V0IHRoYXQgZmxvb2RzIHRpbWVz
dGFtcCByZXF1ZXN0cyBjYW4ga2VlcCBhbGwgdGhyZWUNCj4gc2xvdHMgYnVzeS4gT3RoZXIgdXNl
cnMnIFBUUCBldmVudCBmcmFtZXMgYXJlIHRoZW4gZHJvcHBlZCwgbm90IGp1c3QgdGhlaXINCj4g
dGltZXN0YW1wcy4NCg0KDQpZZXMuIE91ciBpbnRlcm5hbCB0ZWFtIGNvbnZpbmNlZCBtZSB0byBz
ZW5kIHRoZSBmcmFtZSB3aXRob3V0IHRpbWVzdGFtcCwNCmlmIGFsbCB0aHJlZSBzbG90cyBhcmUg
YnVzeS4gUHJldmlvdXNseSB3ZSB3ZXJlIGRyb3BwaW5nIGl0Lg0KDQo+IC0tDQo+IFNhc2hpa28g
QUkgcmV2aWV3IMK3IGh0dHBzOi8vbmV0ZGV2LWFpLmJvdHMubGludXguZGV2L3Nhc2hpa28vIy9w
YXRjaHNldC8yMDI2MTExMy1zMjUwMC0NCj4gbWFjLXBoeS1zdXBwb3J0LXYxMS0wLTdhMTg2MTQx
OTUyYyU0MG9uc2VtaS5jb20NCj4gPGh0dHBzOi8vdXJsLnVzYi5tLm1pbWVjYXN0cHJvdGVjdC5j
b20vcy9UZWJ4QzZZcG5nY3JnUjhqb2Y2aDdRdDUtDQo+IFByZT9kb21haW49bmV0ZGV2LWFpLmJv
dHMubGludXguZGV2Pg0KDQo=

