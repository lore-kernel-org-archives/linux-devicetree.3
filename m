Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazolkn19011034.outbound.protection.outlook.com [52.103.13.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C36317145
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 16:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.13.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781196427; cv=fail; b=Y2IKTTERkE5fWVGC/rcPs/bTNHDpgM/QTImipnX9Krq67DPbOF4kWAlZNWxevBzOTbA/P6vCVMNDr1Ij9bMsBXDSw30V/4YyY1EfnxvWSiyUVdj/x/UO3IoYclm6nplfykxpFJTOByfBgWfmGNim6Mx9+X+6gybaPZQ20zzht40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781196427; c=relaxed/simple;
	bh=reP/qATWegDuuVFw/4LdntDlExN79eRgY3MOIsZybBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FAhZ50FpRxHXzeUVF/F/OxTjnPqnmb/oSX2iuRpFF+oj2oWJLL5EtLWne9VTKKvhi8upV5Y/1B6KtdqKq07HM/V928qogOYU+2idINIFNKK9EjUOprrvXFyCxhiY8Cv2zmNe6kwUjO6NHpmPynvIn5TGMVdk7WZj9EpVO7p3X7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=MKtky29u; arc=fail smtp.client-ip=52.103.13.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="MKtky29u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XHgv2Kwek5AU7925McJhiNyzUu8MzN2KotXwVOGLlhr7YannXtnOaMt+A7SUDkqj9v7h4utKqaVv1aIGmrqxE5xEdXBFaHN6ZcdMJ6ouEgEI+xBQYLD1vARG6kDHw/y12+C1GIYbiyyg2Y1KMK3eKUMMurfMDsEOjdTVtFL+iEgHpL52yP7TJN9YoHlqz7dQYF8mREEOCgA1mGhydQCnL8XTL0kYeB/g7BFWewQpwpAurFFBGG1B9yXHd7YC66H29WVn/KVshY6SiBIGdih2jTepD4gCnSKKbAwig4vo1GZfoKMDiYfws8z1SOAfru+60UXCjn1lY7HArRXvOPXm9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QobipKBFGiIs97hC9MlHSQSmEPBkLtCNCbPUnecNTEo=;
 b=x7e+glnwC+Eb/5QwBrW5uE7M3tucruIZDQpWLfu41d3XLnCWPZtrlVLWrSIKuiueWwCaG0POexpFjoyA4WzywxN5W9K+MdgTHbEVckg80TBYqs8ZiAbQ4TXklILFmmV51ibqkwB7jPwWHSOYCrGGslbqFV5XhsbYBtKfPoktabbgWSLSuywYZ1Vz2Xq+CnCAzWbzOWBMvw5frvIwCFQMNEIyZVSJ+Q9jpxffqeea5pKL3iuLg4vCtDeR1K0Kb+Uale4RbgLfdbJh4g/U+eby7URbrlV1GWYnGllikbiEIEyCyc13bE2Eqr4Rmo+TwyRW4+DwOs9wDKrLXyahwFF+Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QobipKBFGiIs97hC9MlHSQSmEPBkLtCNCbPUnecNTEo=;
 b=MKtky29uJ8cwLdPGpbOr6ft7oeCy2fGIlx1UuSJYgdQbIk3Hr8bWn2aaj/2f9n84gtcSHdxG6IgnmjYGvd7G9/B6m7mX3UpQ/8BhZrDuzWBKzueGgpgvZRawiInaE4YAsmG8mc+ICvHF5wEIdZ2IYt/EAi63W7TVHxjAqWr/CKSRrewc4JGA7e4dm4zaFXgKMaMr2NL+nykwEWJSD5XxoR/WITwpIM7PONOetsMAF9mmXofvZarAItJaU3xFVZoQzDlja5uCozh/MlMa6tWbX9qNnECKSUnmzKqPlCUqVMz8Y0GS2EJQmh66qv7yUGFxNGd8iR1TJRklUqnwH31cCQ==
Received: from PH0PR19MB997338.namprd19.prod.outlook.com
 (2603:10b6:510:3b1::18) by DS0PR19MB8414.namprd19.prod.outlook.com
 (2603:10b6:8:1bd::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Thu, 11 Jun
 2026 16:47:04 +0000
Received: from PH0PR19MB997338.namprd19.prod.outlook.com
 ([fe80::fd22:ee23:3e25:3172]) by PH0PR19MB997338.namprd19.prod.outlook.com
 ([fe80::fd22:ee23:3e25:3172%6]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 16:47:04 +0000
Date: Thu, 11 Jun 2026 11:47:01 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Chris Morgan <macroalpha82@gmail.com>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	xsf@rock-chips.com, sre@kernel.org, simona@ffwll.ch,
	airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
	maarten.lankhorst@linux.intel.com, jesszhan0024@gmail.com,
	neil.armstrong@linaro.org, heiko@sntech.de, conor+dt@kernel.org,
	krzk+dt@kernel.org
Subject: Re: [PATCH V7 1/6] dt-bindings: power: supply: sgm41542: document
 sgm41542
Message-ID:
 <PH0PR19MB997338544F64D0799C799908E6A51B2@PH0PR19MB997338.namprd19.prod.outlook.com>
References: <20260610144407.438846-1-macroalpha82@gmail.com>
 <20260610144407.438846-2-macroalpha82@gmail.com>
 <20260611163613.GA2922314-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611163613.GA2922314-robh@kernel.org>
X-ClientProxiedBy: SA0PR11CA0082.namprd11.prod.outlook.com
 (2603:10b6:806:d2::27) To PH0PR19MB997338.namprd19.prod.outlook.com
 (2603:10b6:510:3b1::18)
X-Microsoft-Original-Message-ID: <airmhZ9G4jSkHnTc@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR19MB997338:EE_|DS0PR19MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 89208035-c240-4877-9431-08dec7d91168
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|37011999003|23021999003|25031999004|16041099003|6090799003|15080799012|19110799012|8060799015|5072599009|53005399003|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?unclRU6XYBN4tR0hZDKvbJCS16WaRoKNxHiNnWKZZ1CJMipg1MCceH/bRclc?=
 =?us-ascii?Q?HFpnJO1C59XhPzgM1oPY7csmvIVo8Y6WlzDP9Hou8fkmBLQRmDg2voTa4UoV?=
 =?us-ascii?Q?6S1E+mtHoL7umk/vx1sagbZk0SroaEgBun9SRGZKIkuXtgYeshTIgwYUo9bC?=
 =?us-ascii?Q?H5CbfURy6rOqg7kJ45+2lzSNBlOOMk44bBb7ZbX5T4/teFQqLmogBDxhZ7XM?=
 =?us-ascii?Q?uYfLtlM8/C8MkYlxhOnoQnmx+Zyq1bWPl3/woav+2HHxU2RDtDvjPL9lhPUJ?=
 =?us-ascii?Q?vFzLAnnegbhAnuq3FEEIW7UCHfthjRFgd4kNM6UpnhsLFPFlsAHaRV1jfp2l?=
 =?us-ascii?Q?qAkKtSxNeoBjpfBkuZJNw8oQ7buXf4mFUVh4NTlVwVFQrK32wYDqvMLaBaLY?=
 =?us-ascii?Q?GorlDSzU/w5dQGQJaj+U08X5LMJzTzpfc++71kd+tFHPkQtxEuFcQLxItM8r?=
 =?us-ascii?Q?GrBPQv5NdfF/jLlVdlnhkVEpkwdDb+9MajDgHMU4MT5/UMqz1Fa1Ss6bq22p?=
 =?us-ascii?Q?nmJyysW6CvUJnIRRNlpG03qjXR7nT4Q2lnkQlCDnwDPWWk0oYDt5kJ3VJ+fY?=
 =?us-ascii?Q?I3Zm/CWyqanockKSx6FfMwFipC46zE9NkI/Qp7+eWszi0vHXRwYc8vA4YLgg?=
 =?us-ascii?Q?pVFVhJqNm9lRR+2SU2D22N49tqN9Z/XHwv4C3/VXomC0kxsGrRKWwWSRmBA8?=
 =?us-ascii?Q?MPFdtO8PVT0TTupEZsZt59/f/rFVT7L1GI+rVybW6knHgbYu0U8ER9VIXsc4?=
 =?us-ascii?Q?IT2u0OPEIkS0+D8Zf0E+QKPVvuTBmyzUKlcGoFa+p/WcXHwyeFSY/cBj56Zm?=
 =?us-ascii?Q?ZLtc1oxKTS+GKPkT4/iFhjra/BWh14Y8OO+e2o7mKRGYjR7ru2OlsuqZKOno?=
 =?us-ascii?Q?gn6SiNUQ4Bnqgvh006iDUGnwvORLS5+DnlbIiGQds0k6L/LB2vpR/tzpdWCM?=
 =?us-ascii?Q?cnImzIlfP2DwU/LFKFAv9O09tIKbjtSmV+CMduPs0Nj5rv81ny9asRSeHcDh?=
 =?us-ascii?Q?m2TBl3nLqswR0QJJdkHGO+eSKwYC3l7cJ5cyDlpp9bL5CCQpccVwKjsgvjp9?=
 =?us-ascii?Q?ZonZ1CC1?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SnJcRtnqeN4Y/X9BytAdOpMP4Jrefk7WUrt2zIzXusQMtYApJSETzUaxdlF8?=
 =?us-ascii?Q?39eUCcRr4WMZ6R51vLZqGNdmvno2YW1NvHMkiUWWUF8sPcAHuS+0H0fYrTDF?=
 =?us-ascii?Q?3qBnnbe7zpwS7o/AEPdwur9McheY+blmpDLzrG4vEoFe0AIJDDgf/INt1+k8?=
 =?us-ascii?Q?Hh0q5h/md7ijljnHp1jEtdW0Dzvdxw+pzOGjZKMPEc/Y/4EDF3jP4uup9VFT?=
 =?us-ascii?Q?GWqt0YuFNNrQmhL8N2LGEVICeQCG5Io40PqWq6vtSWfH3+J0K1HThnwIT+yJ?=
 =?us-ascii?Q?BSivSRsp54At6jabgMoa/HSSFGtycWWxlUeN3h+EYK00PdLwViljOdDcFknu?=
 =?us-ascii?Q?2dcUiv+CPLF0XWGWgf3QCcjCQVcPu2Ge7r0iYg8dPrA4NlKv0z2Wj5FvJsaX?=
 =?us-ascii?Q?hKZ3i/3a5fy8HH3px7xK3hUdtXOHt2vpjW38q4ZuUi/WfC32f13BUqulx7tk?=
 =?us-ascii?Q?MOoKRBhSyukYKmiC4UOfpbmEnSWmb/ES4HK75sQjnpo7FZWiA6Cy27OmKMVw?=
 =?us-ascii?Q?e0xstGg3U67A7nV+rBS4t0bDK95Dr8DIltIfxq8TAKXcLsT2CrmdUhp+B4cv?=
 =?us-ascii?Q?312khb8/PkFwVmqgF+WgU8hJITTHJYz+zjgLdgWRndsObcjeJIiAhynmsQ+/?=
 =?us-ascii?Q?s5tnVvunZSBG0jD8T0vlmQ3ng3RrlF5HXDgFpbX6iYcoUkW9nzMV+SCQtMfV?=
 =?us-ascii?Q?PAf5AWuhQ+zPhiil7Hv61mt+k87X5GQv9Qq3tXtyxx0bV7OFu734ouFD8OPR?=
 =?us-ascii?Q?bMnMREnAEbK/Kv+wqazN6CvQYLL16/I00Mwmb4flkIXhRdhCmAxyOMEuElow?=
 =?us-ascii?Q?1B+imp4RMq9nE3NsdkntnInPcMElpucTyv8LfSQVFaZfNH3W2JdBX37iAJ+9?=
 =?us-ascii?Q?xGJVBJtqLCE1/9rWbZNC6ZUdnr+cqv3Tsjw1sdo5R6X+lyzL83UzM9hdCkDH?=
 =?us-ascii?Q?aGbYT2GicmCiAo/dYHf0acIPfGrhmNdzLvhkCNa5crQQTdG4rfE4H1rRhj9N?=
 =?us-ascii?Q?f5qCcUnPJ2mf/TuKrDCwVvqEqCeVjYmNtBgD+XqKWWzS5nObsiSk0rwvj8jf?=
 =?us-ascii?Q?mEm/egjuOKtlwFckwgpS8NXf/PpCYQtEDp7z7mdXG9ZmkEB9fzDBGFijjucQ?=
 =?us-ascii?Q?N6dmjS9ncPvfCyrPHW7Vw0gMyCEsbNoxa5Uf+VLIfRYHlH81WVGJpdO8KKVt?=
 =?us-ascii?Q?YT0tubCKr12nqJGfOlZCrnfqUCju2+SSaEFxi32GfFUUxbBHNHSdk62I0ZIc?=
 =?us-ascii?Q?ShPU2Sghgd2O+kjibKgR4Wi0V3UWhD8FSBmjX06hnpnwDV3ibFzZF0ZzLx4K?=
 =?us-ascii?Q?jBGJn2sWuo71zUWa8wItsliEa3oab7RcBB2BCrXziFioatSARDA84EnTvV4G?=
 =?us-ascii?Q?i0DoFcmJMRWowMOIQRS+TNfMN9Iub45BJO3ZuEBIEe3qOm9rtA=3D=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 89208035-c240-4877-9431-08dec7d91168
X-MS-Exchange-CrossTenant-AuthSource: PH0PR19MB997338.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:47:04.9255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB8414

On Thu, Jun 11, 2026 at 11:36:13AM -0500, Rob Herring wrote:
> On Wed, Jun 10, 2026 at 09:44:02AM -0500, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Document the SG Micro sgm41542 battery charger/boost converter.
> > The parameters of input-current-limit-microamp and
> > input-voltage-limit-microvolt are defined as such since they are in
> > common use among multiple bindings currently.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> 
> Missing Conor's reviewed-by.
> > ---
> >  .../power/supply/sgmicro,sgm41542.yaml        | 96 +++++++++++++++++++
> >  1 file changed, 96 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml

I'm sorry, somehow I accidentally dropped it. If I need a V8 I'll be
sure to include it, unless you want me to submit a V8 to add it?

Thank you,
Chris
