Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E8532ED24;
	Fri, 17 Jul 2026 04:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784261517; cv=pass; b=GxHjVodL4czkh3DUfNg2pHSgD5B/STrYZPO26LYwv16TFG1aXt2b1wYmgOKeaEx2ejsyySWGS0Y/gfeJgD1eu5324CNDebXhPp58rT58yCk0YjtVcMwAA1ekPSr/WKNbk4n/TXuqoYj4OvpPConXva5jA+G1kICUoVzj3o7EUCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784261517; c=relaxed/simple;
	bh=Zq1DHFDHnBzs+CAXPlJneFsndppFdKof/as8V86gfss=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Pk385hlQ7fwYwMHLvx2BbE7zbI1uN3eF2d7pnlV55rtGDtSTSzaRjJXFcaa93QI4xPly7IWHWCFOcruOXcrXoRo+mNwAY4wOWyDJpoF5S6kmhQoP853K8Pqtds/NGmljnrDUfeR+X5FrrBXZnO2pju1LE5o3EyHyLvSY3ncSKbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=dNNhj4V3; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="dNNhj4V3"
ARC-Seal: i=1; a=rsa-sha256; t=1784261497; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XfzPhh/hPJPWjFvAzqiu6IIg1xWuNiRGWhV4c6MCaP7vZtzs4ieYFlI6pgdI+9QpUGpthxyAyPtVOetKMT6rOjmRR1nJ9YvFneIPPj9LG/8P1yHfvNDoFxkHSM1oYOBQJx3nPD1ycSGQqsVOUj69HJ49M+60DaqfCS3wGNZquFg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784261497; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Cg2f+UuUSNP7C/YEPxihEcuoxaaMP084bVnG9R6gApE=; 
	b=UxJusN0W+mWYGwvvj2hXF+T63Dgs9CJQQ66/tTRAGW9EkEi/erLkXuMarvS0neHKrAxW02qZgEeylItIF/G2i25JbMjMOC8cST5N5mX0HiK1+13Ia0tuMI6LNcSVbM/wCeeUvw1cUatyuOUIikNO/cme+Nck9CCdqsfYSCWTmpM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784261497;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=Cg2f+UuUSNP7C/YEPxihEcuoxaaMP084bVnG9R6gApE=;
	b=dNNhj4V3CQG35nNkE400CvH3F46vXMkc1/NV8cmGaNseXmrQyyrG+5UWuTpX02w4
	GYgZ7+hdgyKrjMUbtKfNPE2U2t31D0QkhaO0fCb6RNceswIkXqj7i2P99JQ/BtHLa0p
	xn+sz7dBYyfAhDsLYwBxVSQ4MMwO9t4M5Lda5/m8gpvFj/TKywf6G3XzlV+sLgiwApn
	mz95SSnuPtvO5p4iBOX4cV2DX+lZj1Ru7eKEZfZ3wgOa3e4XKvtEThgZ/eoTbM1uI2M
	HfQQhBEu6GCLVMtqO+gMEV3pCjnGjNiqcR+vz0o96DqWrWcTh+XdjalVwjMDnnvLU8a
	1cJPneMdNA==
Received: by mx.zohomail.com with SMTPS id 1784261492979721.9219173375741;
	Thu, 16 Jul 2026 21:11:32 -0700 (PDT)
Date: Fri, 17 Jul 2026 12:11:23 +0800
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
CC: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, MoeLeak <i@leak.moe>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_4/5=5D_riscv=3A_dts=3A_thead=3A_Ad?=
 =?US-ASCII?Q?d_IO_labels_for_the_IO_expansion_on_I2C1?=
User-Agent: K-9 Mail for Android
In-Reply-To: <allEg/A+Gt/em0Hs@x1>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn> <20260714074515.1959352-5-zhengxingda@iscas.ac.cn> <allEg/A+Gt/em0Hs@x1>
Message-ID: <1E3154C2-B5BE-46FD-BBFC-87E56FAE3AFE@icenowy.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External



=E4=BA=8E 2026=E5=B9=B47=E6=9C=8817=E6=97=A5 GMT+08:00 04:52:19=EF=BC=8CDr=
ew Fustini <fustini@kernel=2Eorg> =E5=86=99=E9=81=93=EF=BC=9A
>On Tue, Jul 14, 2026 at 03:45:14PM +0800, Icenowy Zheng wrote:
>> From: Emil Renner Berthing <emil=2Erenner=2Eberthing@canonical=2Ecom>
>>=20
>> Add labels for GPIOs on the IO expansion chip on the I2C1 bus=2E
>>=20
>> Signed-off-by: Emil Renner Berthing <emil=2Erenner=2Eberthing@canonical=
=2Ecom>
>> [Icenowy: Splitted off the patch adding all 3 IO expansions]
>> Signed-off-by: Icenowy Zheng <zhengxingda@iscas=2Eac=2Ecn>
>> ---
>>  arch/riscv/boot/dts/thead/th1520-lichee-pi-4a=2Edts | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>=20
>> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a=2Edts b/arch=
/riscv/boot/dts/thead/th1520-lichee-pi-4a=2Edts
>> index 74b120c6b063a=2E=2E78f5979a56c14 100644
>> --- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a=2Edts
>> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a=2Edts
>> @@ -128,6 +128,14 @@ ioexp2: gpio@18 {
>>  		reg =3D <0x18>;
>>  		gpio-controller;
>>  		#gpio-cells =3D <2>;
>> +		gpio-line-names =3D "",
>> +				  "cam0_reset",
>> +				  "cam1_reset",
>> +				  "cam2_reset",
>> +				  "wl_host_wake",
>
>I am not sure the line name really matters all that, but it seems that
>pin 4 is also used as a reset gpio:

The "host" here is subject, which means "this pins is used by the host to =
wake the wl"=2E

Maybe I should take the schematics name, "wl_host_wake_dev"? Or use anothe=
r name on the page for Wi-Fi, "wl_reg_on"?

Thanks,
Icenowy

>
>  wifi_pwrseq: wifi-pwrseq {
>      compatible =3D "mmc-pwrseq-simple";
>      reset-gpios =3D <&ioexp2 4 GPIO_ACTIVE_LOW>;
>      post-power-on-delay-ms =3D <200>;
>  };      =20
>
>Did you notice that too?
>
>Thanks,
>Drew
