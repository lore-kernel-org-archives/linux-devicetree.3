Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A094CB8AE
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 15:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448596; cv=none; b=ZEq8zkL3XWyKyGzx2HRIxmE8bLCsg25veR0xh6jm6dcWzl5ppnsROgQGxUrkqpTohSIajXXsi7xR3teA2GZ6MYLhcK9JwX4KYTQ4v1L/PH1pSi4N0sALhYlJ6u6IR+FQ7u+Jy9Vx7mGujulcUieBamWl1wss6rgBVFrrX8xp/4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448596; c=relaxed/simple;
	bh=3k0aNco/wk53J9o68OsFWzaMKHfhgDwFOg4q1Ff6mbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OnSspcWZfRlnzAan9A3p6lvvvrGxxBpBzeWkwaMunsYdUDS1J3d6St3wjB/DoHVSXeFcPOiDwxUcChWwKaqUy+fbDz4p7O+/qeHvfxWh/7erzkJmAe47zqPeZLOTdqukdarWrN0RAMzRkeyRvV9F0tuVv/GlupxdkHSuLQHjLqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VmNxRC8s; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VmNxRC8s"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-484374f54d0so1574310f8f.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788448592; x=1789053392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjN+r66d4VC/wMvjXwpeTffXWtgz3AZsnsncg2qP2S8=;
        b=VmNxRC8sgLlWoU6oEyI3si05oltdjgG9W9rt2gy2KSUj80vFmX/phScTGxR9fKZwKd
         fJs7JiloMoLScBIkadAGBwzPoau9wXPY1GV+IG25TzlDPC+qTp2CiBgkZDT90c9uX5Lp
         hIaO+vZWa3YJhPsoM5/+eaFHDgdjGBvcz/8x77RlELa2tZxiTh4t0aCs0DPTW4WbbmUb
         impW2hK+RAY9wFlYwbkAHfG694wjZACcEcgbsaXX5cC/12uvunJA1kMCc5d0RXSNemIt
         i87QVEaAMln0g0E4nkvYQ1XCcQxr7F8Twofq5BcnTi0oIPVsMQYdjaRCrbOgAHfA0HEm
         1Rog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788448592; x=1789053392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjN+r66d4VC/wMvjXwpeTffXWtgz3AZsnsncg2qP2S8=;
        b=JzuWXJ+nbsyfS7xvKTvTAV16Ikear4/qlUaM9XdfdLrQMmBOJsGg2y+rWuH2lIB4LM
         aSoZsR3N3SmsMfQtzCwsWcYRnXRT6cX8EIiu76XCMmnd95reio4Ci8PIMlxy4v4IztjE
         Yj7r7wZ5c48HwGgLc+5B02cjHpa8XyhZM6zVABvvha13iOItslfrwXo9rbgN9Qj52Nt2
         PKbnR2K5IpohmgW/XjYNetnqRSvZP4cMPu2Gu1sK6tTplC9EKywbhUf2JJ6hftwlKjJ6
         weUq9N5XO/zpJg3McUR2sY7Zdy39klYvvsDVGYOkx+xH7JnsmshxidQx+zcIATH5le3Z
         qqhA==
X-Forwarded-Encrypted: i=1; AKwUvBwaTZhsQSTLG+KTpoStSo4xP4DFu8Kc1yar9c1WTQK1JKsY//YW0wKBG0WHY7zk+BqPqRnXJ3yJuG7t@vger.kernel.org
X-Gm-Message-State: AFuF++lKPpdcTpJdLIV4UL3btZICaxrErlBdqIdml/5FGD4IqYNzx7Vb
	au2q5lhhIGGc96bvwhnVRCbpndrlNO2VmmtuUwS8JgPBHRGrjo5hr5jVjfAkUZ0f
X-Gm-Gg: AYBFou1RzYaJpVFPqe/zO1HTnaCeqiKMz+IJjHg2uK8Wn5sCXdm8GoRnKifOZBK1/NS
	+VRmfKAboOuMH88oH9FVGtX0xnCOqeUrD1kfB/aWYgh0/ghyDeEL9hXPawFZVTBygC9nZo3zXI+
	cAc7j/uPO0o9b5/bSGw2GBfrj9kMesYfETY7DmR6/Qh49pwn+eEhsFLAclCdIsk1gRidVGpUlS2
	DKnzeFItvcCB59f8Ejkw+k/IpcDCrPH9QhW/fWQ+AXI9o6RSjWfZEZpH0tbVI7X6fyxVXHkQM3z
	yfq3kZGfFrM9J3rY8cSisC3DPZTcirR9hMd0Vx8f2glvDQEdb9PRBoW3mlAPl/1sTrTz0ESCO43
	ov7CM8/PqqSVqlaM4MuqTXvIUavg8/eGMhBOQN5MHRxf15bz4WwXPbBjBTmddOALEVFi+jZu7aL
	NdAJ+md0R3Vy6bCTbqVErfWoL5LfSfWnNr4ARukLxf8Yul9gOIa1jReGVHuKYR/HCh+C9vKjJ2X
	hchp/RymSecmf5EORolK9CqvnWVklG70kmSqQ==
X-Received: by 2002:a05:600c:8012:b0:49a:252d:52f5 with SMTP id 5b1f17b1804b1-49ce583d99bmr267144185e9.11.1788448592068;
        Thu, 03 Sep 2026 08:16:32 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.67.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm77119535e9.15.2026.09.03.08.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:16:31 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iio: adc: ti-ads1015: Add support for label
Date: Thu,  3 Sep 2026 18:16:27 +0300
Message-ID: <20260903151627.5011-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <apkRJ8T-X-HoNiDB@ashevche-desk.local>
References: <apkRJ8T-X-HoNiDB@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 9:18 AM, Andy Shevchenko wrote:=0D
>On Wed, Sep 02, 2026 at 01:37:45PM -0500, David Lechner wrote:=0D
>> On 9/2/26 12:22 PM, Flaviu Nistor wrote:=0D
>=0D
>...=0D
>=0D
>> > +		if (fwnode_property_present(node, "label")) {=0D
>> > +			ret =3D fwnode_property_read_string(node, "label", &label);=0D
>> > +			if (ret) {=0D
>> > +				dev_err(dev, "invalid label on %pfw\n", node);=0D
>> > +				return ret;=0D
>=0D
>				return dev_err_probe(...);=0D
>=0D
>> > +			}=0D
>> > +			data->channel_data[channel].label =3D label;=0D
>> > +		} else {=0D
>> > +			data->channel_data[channel].label =3D "";=0D
>> =0D
>> I think the normal way to do this is to return -EINVAL on channels with =
no=0D
>> label rather than an empty string.=0D
>=0D
>=0D
>In this case the whole dance with property_present is not required.=0D
>(What you are saying sounds like label is mandatory property, but=0D
> how the old DT will work that have no such property?)=0D
>=0D
=0D
I also consider that since label is not a mandatory property it should=0D
not return -EINVAL just be simply not being used in the device tree for=0D
that channel. Since the iio core exposes in sysfs the in_volatagex_label=0D
for all channels, there are 3 situations:=0D
1. The channel is defined in the dts and has the optional label property=0D
assigned, in which case a string is returned in the console in user space.=
=0D
2. The channel is defined in the dts but has no optional label property=0D
defined in the dts, in which case it an empty string "" (a default) is=0D
returned.=0D
3. The channel is not defined in the dts (in_voltagex_label is still visibl=
e=0D
in the sysfs), and reading the label will cause "(null)\n" to be printed in=
=0D
the console (as indicated also by Sashiko boot), since the default "" value=
=0D
is not assigned during device_for_each_child_node_scoped(). I think this is=
=0D
not an issue since is just the way sysfs_emit() handles an NULL string.=0D
=0D
My initial version (v1) handeled all 3 cases, for case 2 and 3, an empty st=
ring=0D
"" was printed out.=0D
=0D
What would you prefer? Any further suggestions?=0D
=0D
Best regards,=0D
Flaviu Nistor=0D
=0D
>> > +		}=0D
>=0D
>-- =0D
>With Best Regards,=0D
>Andy Shevchenko=
