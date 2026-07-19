Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C4F175A85
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 01:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784424657; cv=none; b=ZA639SYNiXhSK0TWvsbQwViH+d4zVZ6kTy4Ex4x4wohL5oeGZCRQGR2/P+2J2LESBDXr6u+as6H3OLZU250LLYvbQhXfXVB09G/CILHDsKHkoGcjNaBQJuWuiNsb00m+hOF60maK0Cjrqq8YUXzlJ7tMs4Kbw/EOZXiwispddGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784424657; c=relaxed/simple;
	bh=9osO2Zx4KgilRX5Tup0aizWvvgaoUynOUu5tyJV87Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qFxcSQzAJIppl41IPwvipKXDCzwUA1Vd5+lzRpTGKvL7NsbQq25doSUTpr2CTZCv7I56DXOJEbEylqMxv5+i3l104rW94hiLVRT3ImwwAtpEhMflLMFENhb+N6lnKpQNg9Uz2Pto374CpSG2iK3+fWb/lTbfqTQF5fZKl18LNag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A7swLMpE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJP1uzFG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A7swLMpE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kJP1uzFG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IN1xVq3059126
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 01:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Me5F8rb0kWK497cohXqHicohxY7ZHnpHhNdeua3f3ZM=; b=A7swLMpEN2MffgpC
	wXyzh0BfMBxBkrgkwYFYIIwNH55AB1T4dZ4nm92UKQYxZIioZV/4eEGl0bDzeEL6
	fiXsDKeSTCHapspcu97rJc09rKQ9cyKZOqazKF2/ezS8x+HWVJm+aKPm/Jixlx2/
	3iStieoPhR6HV4X5iJ0h1vNEgCfJ84AJ4WZwevBVlTeh3gLYW+wJPqSZ+szhXtG0
	EP/0wCgDk+KzhQBRig+mzByMq1EwfKB8ebYbBfJaFHY9x5OE25kl5E4gGzw1wu3w
	xlJD/MW3zkbLnTXZap8UigwC0BXyH26UAOPYI80cwsNSXVx/KNbT17I0Wedrrl0U
	bAuNjA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2aasvh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 01:30:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84865f326efso9415499b3a.0
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 18:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784424654; x=1785029454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Me5F8rb0kWK497cohXqHicohxY7ZHnpHhNdeua3f3ZM=;
        b=kJP1uzFGNMwuABVnONfiwsxzM1+okCVbrTRgLXZJKlo/c7ytSipazxcx2p+yQsAB9C
         ChX+1dfK2UGG5NjkvfqOb7EA7/EkUm8MYZ76bg8NtezOi4xi/Ca0gzDYzq+lcgExNA9M
         UKbI1wCnsFhPrvadnsuSZzKVnPYeiol5wggGIukgnfyUvwPhle6fechJyV9plELmGqMt
         nhQLAcvToz+BapBpRhm59xp6lrf4Zo7f3Y0TioD+egKbZFsx+di8eTUvPsCe7A9TpxPw
         bbAOiIVfOkfDvt7WzWz0P1pwE0d7HFnLMiiUxU4AItSenRibznR7zGxlMIhrhqOpZB/w
         JN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784424654; x=1785029454;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Me5F8rb0kWK497cohXqHicohxY7ZHnpHhNdeua3f3ZM=;
        b=tEAlEAFAPWc8nAZRrWbBDs7NwQDmKdQH9a/t3Gfy7uj+h6fBRZT+O7RjCz/utzCHjF
         qXtvQqkuyIvaYtJ+zIEQUbQ8AWgL7k0ff63XWOZ30eQ+lGLKfHwGZD4JwjiogHbveANu
         ggtmFfaJQYBZodF+I8yc0RDlf1810jIn+Gvzxkt0S39907YsOHEI6i0q8aB8yZABwRVx
         cxUGVPojEv67PhsY3tK7PiwOy8fGuj8RLX6eMwr/aIrgZpahlK3WD3r6kc05AoPH4BEs
         oWBzzmLIYfXMk/dVxMWW6Ia+5wTYPXbmd/d8O1CFyG7Z7UHn7hhWayv2Z1w5MWTKS0FM
         75vQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7L6KIMXUZxObiA61krO6vVnMhVVbbHdEk+Dt8cwSRwkHGjHO1fUnTnPThmalTws0adIhOWeSW1b5o@vger.kernel.org
X-Gm-Message-State: AOJu0YwO4d0Jyd/yRR5R5AquOweAE/w7c8sdxU0KivpBjst3QnLkmyOo
	URqsrvouhwC5rKrGqvYfD6CkqkgpRzI2N6XTB+VCYCM3GUJQxEvlaln/P9/t0iDDhsRsCMCuU1E
	+UvbWId9Tvsm1sKTbl+cKNDXabJQ8rotSIQxv6q+BKXMlGVXnXtZMjNeoPqfMAY48
X-Gm-Gg: AfdE7ckDosvl067TYn7c0M7Qja914gtfrHMiflWK5Auj/lKf+mDoHAkOhaXku3DTlXq
	siOcLmRVf/0+Hi3G+f+lKTedPJCrrqiZJOi/UFJ3+keKpopSgvoGlZJuFEiW9xwt+ExbwMLZKSO
	h8xJVcO06IZrwa0ijwCe+nbxrWY+9rw3S8VN4ty1ZFQzF81ACOZTR9myOyGxcjk+HgbpP/JLES7
	D0PFSEoq6nMznZyf4oQH7rOGiMN2+jlIhFV/yYq3b7jTWn+F1fU6MsdtyqUoiU2aSySFwY52/lE
	yHCQADhkg7N5NHUqtglEjXgcteu2NRXeXhnpU1MOeWadOFmI7zXpb0l4E3tGNELnJlJAEMW02lx
	J+18IZ2DooIVuVa7O
X-Received: by 2002:a05:6a00:3a1c:b0:848:6b76:592f with SMTP id d2e1a72fcca58-84c29305424mr8239320b3a.5.1784424653735;
        Sat, 18 Jul 2026 18:30:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a1c:b0:848:6b76:592f with SMTP id d2e1a72fcca58-84c29305424mr8239287b3a.5.1784424653053;
        Sat, 18 Jul 2026 18:30:53 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af9f477sm3497446b3a.58.2026.07.18.18.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 18:30:52 -0700 (PDT)
Date: Sun, 19 Jul 2026 02:30:47 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Esben Haabendal <esben@geanix.com>, Lars-Peter Clausen
 <lars@metafoo.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Martin Kepplinger
 <martink@posteo.de>,
        Sean Nyekjaer <sean@geanix.com>,
        David Lechner
 <dlechner@baylibre.com>,
        Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy
 Shevchenko <andy@kernel.org>,
        Martin Kepplinger
 <martin.kepplinger@theobroma-systems.com>,
        linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iio: accel: mma8452: Allow open drain interrupt pin
 configuration
Message-ID: <20260719023035.2380e8df@jic23-huawei>
In-Reply-To: <alpqq3zhSS_iYGJq@ashevche-desk.local>
References: <aldH3vtk_eKh6oCC@ashevche-desk.local>
	<87ldbco582.fsf@geanix.com>
	<Tu8Mavh-mfl8Vv75Oab3vrghtEbTXiYPZ4qhj6RZv8xe5nWKP4lG1KSuJXEQfyKeio7zv9myLbmifMjFTl8juA==@protonmail.internalid>
	<aleQVYrK9YBoLqGl@ashevche-desk.local>
	<874ii0misv.fsf@geanix.com>
	<alefh86sqW-XvLHl@ashevche-desk.local>
	<J2apVLUJhrI3AOweGpouqGGB0XhxbcqLiWasDpOdm4d2YGgNv8PuE-udUGJZcH0z-V9yyqbjIwMKDdtuam0mp6ya5F6GHUzf6OjRCo0GdaA=@geanix.com>
	<nnp75d8J8In8paKGfojb_WdiRMfnz84lOlzz_LBKVsxDzR3fG7Y5Mn91q6P4BF2LetfZS7da2SeqGhpiLUOE-A==@protonmail.internalid>
	<alkgZTnHyvEasMCk@ashevche-desk.local>
	<877bmtsu1h.fsf@geanix.com>
	<alpqq3zhSS_iYGJq@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bH0zhGX2H48ynQL7y6JL51pe4rz6DokM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDAxMiBTYWx0ZWRfX0lWPutZCQ6CM
 0VXeLWrXCJkOdTCnjTGbjKVM6XU0vPno5oaiyavFXgfldRD8haw6aqD51zy0EasCawQUpocBf/M
 V2imrkezK0E/GPji15uzbzJlJzoNn48=
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=6a5c28cf cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=QyXUC8HyAAAA:8 a=cRCOgWbdNRi4hK29Oz0A:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: bH0zhGX2H48ynQL7y6JL51pe4rz6DokM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDAxMiBTYWx0ZWRfXxJ9sITgrrgOH
 IKTA7Ru0/WOa5HXv3wyAP3uxlGeUSQyFE7GedF2Nk/Qj+mNgmmgEBf4exXOqNDNWVx6GP+ORZW9
 wz//ouQ5eY84q9swUMWEzMjV5tw65PbkUwpjSfnU+H+pAyBvVBuRFotIXYBp16inb9DIjK9uqOg
 i/2wkwHs2uCcZLCg5o++f1sQhMX7bE2LD7bPdiMDNhsCZxf5CEGaxtVRqptiLTiSUANkrbF6J9w
 /QVMFrn0Xalc4wUvN9oQtadBD6doYtO1wS1D0ssJdP7Wig+3YV27TeZMz5o/fYZ9QHm0uOU7/oN
 iro13Cor5fTG1ebbNaVY9JQsCPk3r/clNPmWnMwkaVUTwZqP+AlOL99AEVorGEd2y5FT8Xq2Tbc
 e/svvJwJZaJnfAxNNJZeOD8Di7aPMBqyY+5/29ufyIj8UQkNld6chublS5ncFRS0d4LaIans6Er
 ulcbiD283BiFUGgmpAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607190012

On Fri, 17 Jul 2026 20:47:23 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Fri, Jul 17, 2026 at 02:02:50PM +0200, Esben Haabendal wrote:
> > "Andy Shevchenko" <andriy.shevchenko@intel.com> writes:  
> > > On Thu, Jul 16, 2026 at 04:51:34PM +0000, Esben Haabendal wrote:  
> > >> On Wednesday, 15 July 2026 at 16:56, Andy Shevchenko <andriy.shevchenko@intel.com> wrote:  
> > >> > On Wed, Jul 15, 2026 at 04:25:20PM +0200, Esben Haabendal wrote:  
> > >> > > "Andy Shevchenko" <andriy.shevchenko@intel.com> writes:  
> > >> > > > On Wed, Jul 15, 2026 at 01:35:41PM +0200, Esben Haabendal wrote:  
> > >> > > >> "Andy Shevchenko" <andriy.shevchenko@intel.com> writes:  
> > >> > > >> > On Wed, Jul 15, 2026 at 10:07:39AM +0200, Esben Haabendal wrote:  
> 
> ...
> 
> > >> > > >> >>  	if (client->irq) {
> > >> > > >> >>  		ret = request_threaded_irq(client->irq, NULL, mma8452_interrupt,
> > >> > > >> >> -					   IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> > >> > > >> >> +					   IRQF_TRIGGER_LOW | IRQF_ONESHOT |
> > >> > > >> >> +					   data->open_drain ? IRQF_SHARED : 0,
> > >> > > >> >>  					   client->name, indio_dev);  
> > >> > > >> >
> > >> > > >> > Why do we care?  
> > >> > > >>
> > >> > > >> Care about what exactly?  
> > >> > > >
> > >> > > > About exclusivity of the interrupt.  
> > >> > >
> > >> > > Ok.
> > >> > >  
> > >> > > >> We need to add IRQF_SHARED flag in order to allow shared interrupt, and
> > >> > > >> we should not add it when using (the default) push-pull mode.  
> > >> > > >
> > >> > > > Why not? How would it make any difference from SW perspective?  
> > >> > >
> > >> > > Not adding the IRQF_SHARED flag prevents use with shared interrupts. I
> > >> > > think we are on the same page on that.
> > >> > >
> > >> > > Unconditional adding IRQF_SHARED flag would allow configurations where
> > >> > > other devices share interrupt line with mma8452 compatible chip
> > >> > > configured with push-pull, resulting in broken or unpredictable results.
> > >> > > I don't see why we should not care about that.  
> > >> >
> > >> > But it's not their problem! If it's this device that prevents this
> > >> > configuration, it should have a check. With this code it just hides
> > >> > and changing a DT property will lead to kernel warning.  
> > >>
> > >> The chip such does not prevent the configuration, and does not prevent
> > >> sharing the interrupt. The irq pin in the device can be configured in either
> > >> push-pull mode or open-drain mode.
> > >> In order to allow sharing interrupt line with other chips, the chip
> > >> must be configured with irq pin in open-drain mode, which is what the
> > >> drive-open-drain device-tree property I am adding in this series enables
> > >> developers to do.
> > >> If/when you add this property to the device-tree, the irq pin will be
> > >> in open-drain mode, and the IRQF_SHARED flag can (and should IMHO) be set
> > >> as the interrupt line can be shared.
> > >> If/when the drive-open-drain property is not set (existing device-trees
> > >> and current only supported behavior), the chip cannot support sharing the
> > >> interrupt line, and adding the IRQF_SHARED flag would be a bug, as the
> > >> chip irq pin requires an exclusive interrupt input.
> > >>
> > >> Maybe the confusion is caused by the fact that the drive-open-drain
> > >> does not describe how the irq pin IS behaving, but rather how it SHOULD
> > >> behave, and possibly required because of the HW designed having tied the
> > >> irq pin to an irq input together with other irq sources.  
> > >
> > > Why do we care of push-pull then? Can't we always make it open-drain?  
> > 
> > No. Open-drain requires an external pull-up resistor. If there are no
> > external pull-up resistor, open-drain will not work, and interrupt
> > sharing is not possible.  
> 
> Right. My question was basically to understand if we have the HW (platforms to
> which this sensor is attached) that relies on this pin to be PP (in current
> configuration)?

I'd met plenty of boards where the resistor wasn't there for other sensors
(including one that 'shared' the interrupt - worked much better once we'd
patched a resistor on) so I'd say it is very likely those exist.

Anyhow it is also trivial to put an interrupt multiplexer in the path for
the push pull case (I've seen this on a real design). In this case an
AND gate will do the job Sure you'd not bother if both sensors were
capable of open-drain, but maybe only one of them is?  We could of course
make that an explicit component and give it a driver, but meh, why
bother - just allow the combination argued against here of push-pull
and IRQF_SHARED.

So I'd just set IRQF_SHARED unconditionally.



> 
> > >> > > > Yes, I understand the HW case.
> > >> > > >  
> > >> > > >> > The (hidden) problem this will have in the future is that the IRQ core
> > >> > > >> > will splat a warning in case that other shared IRQs might be
> > >> > > >> > configured with different flags. Putting that flag conditionally makes
> > >> > > >> > it a mine field for the users. Instead just unconditionally add that
> > >> > > >> > flag and we will get reports as soon as there will be a user that
> > >> > > >> > shares the same interrupt pin with some other devices which drivers do
> > >> > > >> > not use the same settings.  
> > >> > > >>
> > >> > > >> If we add the IRQF_SHARED flag unconditionally, it will be set also when
> > >> > > >> push-pull mode is enabled. I don't see how the kernel will be able to
> > >> > > >> notice that that is not going to work. If you have another device that
> > >> > > >> uses IRQF_TRIGGER_LOW|IRF_ONESHOT|IRQF_SHARED, it will not work with the
> > >> > > >> MMA8452 device when configured as push-pull.  
> > >> > > >
> > >> > > > Right, and why do we care (again)?  
> > >> > >
> > >> > > Why we care that the system as a whole (SW on top of HW) will not work?
> > >> > >
> > >> > > If we don't care about that, why do we even have this IRQF_SHARED flag?
> > >> > > The only purpose of that is to tell the kernel that this particular
> > >> > > device / interrupt will work with shared interrupt or not.
> > >> > >
> > >> > > Isn't that exactly what I do with this change? Nothing more, nothing less.
> > >> > >  
> > >> > > > It's pure DT/FW/HW issue, not an SW issue.
> > >> > > > Otherwise it will become a carefully placed mine for the poor user who will
> > >> > > > use these flags and try to share an interrupt with the mma8452 device which
> > >> > > > has no set property and uses push-pull mode.  
> > >> > >
> > >> > > I don't get how you see it like that. Adding IRQF_SHARED unconditionally
> > >> > > would create exactly the mine field you are talking about. Poor users
> > >> > > can specify a system configuration (DT) that tries to use a shared
> > >> > > interrupt line, but configures the mma8452 compatible chip in push-pull.
> > >> > > The poor user will not only be poor, but also unhappy.  
> > >> >  
> > >> > > By applying the IRQF_SHARED dynamically, the kernel will be able to fail
> > >> > > in a controlled manner instead, making it much less painful to create a
> > >> > > working system configuration (DT)  
> > >> >
> > >> > And my point that we need to make less painful runtime experience.  
> > >>
> > >> Yes. We agree on that.
> > >>
> > >> But I do believe that my patch is that painful runtime experience.
> > >>
> > >> Adding IRQF_SHARED flag when irq pin is configured in push-pull mode
> > >> will be painful. I know, that was my initial approach. Does really not
> > >> work, and can lead to wasting time on debugging the HW.
> > >>  
> > >> > > Going back to your poor user story above, if the poor user tries to
> > >> > > share the interrupt pin with the mma8452 device, it will get an error
> > >> > > (just as it is with the kernel today). The device does not support
> > >> > > shared interrupts. Reading the DT bindings documentation, the user
> > >> > > should be able to find the drive-open-drain property, and add that to
> > >> > > the device-tree to make things work. Maybe even consider if that is
> > >> > > compatible with the hardware being used.
> > >> > >
> > >> > > If IRQF_SHARED was set unconditionally, the user would not get an error,
> > >> > > but most likely would get a system where no irq's were raised for the
> > >> > > other chips. I sincerely believe that debugging this is much more
> > >> > > painful than reading device-tree bindings.
> > >> > >  
> > >> > > > Did I miss anything?  
> > >> > >
> > >> > > I don't know. Maybe I am missing the obvious here.  
> > >> >
> > >> > I consider the case when shared interrupt is enabled on both devices, but
> > >> > second one (driver) missed the same IRQ flags. This becomes a warning in
> > >> > IRQ core.  
> > >>
> > >> Missed which IRQ flags?  
> > >
> > > _LOW, for instance.  
> > 
> > All devices sharing an interrupt really do need to agree on these
> > flags. Do you known any drivers that does not specify the trigger type
> > when requesting an irq?.  
> 
> Huh?! Majority of the device drivers! And that's how it should have been from
> day 1, that's why I call this a pre-existing bug in this driver which we may
> not address :-(. But we may address it when use SHARED interrupts.
> 
> > You cannot share an interrupt line if not all devices have the
> > same trigger mode. So if one device on a shared interrupt has _LOW, all
> > the other devices need to have that. Not just the flags, but the actual
> > triggering mode of the device. Some chips might support more than one
> > mode, others only one specific mode.  
> 
> Yes.
> 
> > >> > Shared interrupts it's also a contract with all stakeholders on keeping
> > >> > the same flags for all devices.  
> > >>
> > >> Of-course.
> > >>
> > >> And adding IRQF_SHARED is a contract that says that the interrupt can be
> > >> shared. I can only see that it would be a bug to add that flag in cases
> > >> where we know that the interrupt really cannot be shared.
> > >>
> > >> As for the IRQF_TRIGGER_LOW flag being set, I think that looks correct
> > >> as long as we do not support switching to active high irq polarity.  
> > >
> > > No, it's not. It overrides whatever platform wants to have.  
> > 
> > The trigger type is not just a platform thing. It describes how the
> > device behaves.  
> 
> No, it describes how this certain device is connected to the certain platform.
> It's a combination of what device is capable of and how platform design makes
> use of it.
> 
> > Device that only support one triggering mode must set
> > the flag that describes that. Devices that can be configured for
> > different triggering modes can implement that, and should then configure
> > the device for the chosen mode and set the flags accordingly.  
> 
> Yes, but not in the device drivers!

Absolutely agree on this point.  Setting interrupt sense / type in a driver
was something I used to miss in reviews and is effectively impossible to
fix without regressions.  This should be coming from firmware.  The mention
elsewhere of a not gate in the path is annoyingly common as it is a really
cheap way to solve voltage level mismatches.

So I think Andy made a good point that, given until now shared interrupts
weren't possible, we can't regress any board if we remove the _LOW bit
for at least those.  With the above thing (the AND gate interrupt combiner)
arguing for IRQF_SHARED always this gets a bit less obvious though.

We have had some 'novel' solutions in the past where we needed to enable
the opposite sense from firmware in which we check if firmware made a choice
to be _HIGH.  If it did we override the _LOW in the driver.
Could that work here to avoid that _LOW forcing in all but a fallback
case to avoid regressions?

> 
> > > It prevents PCB level designs from anything else.  
> > 
> > Yes. In this case, the current driver does not support designs that
> > requires the mma8452 compatible chip to be configured for active high
> > irq trigger. We could and probably should address that.  
> 
> Exactly!
> 
> > But that is a different issue than what I am doing here. And I don't
> > have hardware readily available where this can be tested, so I would
> > prefer to let somebody else do that.  
> 
> No objection on the specific issue, but...
> 
> > I am adding support for designs that require the mma8452 compatible chip
> > to be configured for open-drain, while staying backwards compatible and
> > allowing support for designs without external pull-up.  
> 
> ...the shared case *is* different. And I do not want the disaster (a bug)
> to spread.
> 
> > In all cases, the driver should register the interrupt handle with the
> > IRQF_TRIGGER_* flag that matches what the chip is configured for.
> > I believe leaving it out is invalid.  
> 
> Again, this chip is not a single party in the equation. Nobody prevents
> to put a NOT gate on PCB to support this device and say other that wants
> inverted polarity while sharing the same interrupt line.
> 
> > >> But on that topic, the chip actually supports selecting between active
> > >> low and high irq polarity. Should we implement something along the lines
> > >> of what is done in smi330_setup_irq() in iio/imu/smi330/smi330_core.c?
> > >> And thereby allow using the device with active high irq?  
> 
I've always been really nervous about that approach because we might get
one of those with a not gate. If we do then we do have to an explicit
device to do the interrupt inversion. 

I did let myself get talked into that handling a long time back but
in conflates the interrupt description at the two ends of a path with
possible logic on it.

> ...
> 
> > >> > After looking into genirq code I don't see other way how to handle this.
> > >> > It looks like we need to address the TRIGGER_LOW first, in other words
> > >> > we need drop that flag when IRQF_SHARED is set, and leave it to users
> > >> > to setup IRQ trigger properly on all sides.  
> > >>
> > >> Why do we need to drop the IRQF_TRIGGER_LOW flag because IRQF_SHARED is
> > >> set?
> > >>
> > >> Users as in those specifying the system device-tree?  
> > >
> > > No, because like I said, the SHARED is a *contract*, it's not just a setting.  
> > 
> > Absolutely. That is the key here.
> > 
> > IQRF_SHARED is a contract, where the driver promises to return IRQ_NONE
> > if the interrupt is not for that device. This is already implemented
> > by mma8452_interrupt().
> >   
> > > And that contract includes the similarities on the IRQ flags. One may not
> > > have two devices with different trigger level, it's a common sense,
> > > right?  
> > 
> > Right.
> > 
> > And that is exactly why we have to specify the IRQF_TRIGGER_* flag that
> > the irq output is configured for.  
> 
> No, definitely the opposite. We may *not* specify this flag in the driver,
> we have to rely on the _platform_ configuration. PCB level.
> 
> > The driver will not switch to the
> > desired trigger level based on what other devices on the same interrupt
> > uses. You have to configure/specify the trigger mode and leve and set
> > the IRQF_TRIGGER_* flag accordingly.  
> 
> Yes, but not in the driver!
> 
> > > So, SHARED must exclude anything that comes from the platform description or
> > > IRQ chip controller (limitations).  
> > 
> > Now you got me confused again. The IRQF_TRIGGER_LOW flag given to
> > request_threaded_irq() is not coming from platform description or IRQ
> > chip controller. It describes the trigger mode that the chip is
> > excercising in the current implementation.  
> 
> And this is wrong. It's not device driver business to define this. More
> accurate it's not only of the device in question and how it works.
> 
> > The kernel would not know how to configure the IRQ chip controller, and
> > in case of shared interrupts, would not be able to check that the
> > devices sharing the interrupt is configured correctly.  
> 
> Huh?! The kernel is responsible to program IRQ chip and the respective
> device drivers in accordance with the platform design (and protocol to
> supply it to the OS is called DT or ACPI or ...).
> 
> There are several limitations for this:
> - IRQ chip that might not support certain trigger configurations
> - device that can only take subset of trigger configurations
> - in shared line case all of the devices need to agree on that
>   on a _platform_ level
> 
> > > So, without addressing that, it makes a little sense to add SHARED.  
> > 
> > Not true.  
> 
> True. Obviously we have a disagreement here and I tried hard to explain
> my point above.
> 
> > Let me take my system here. I have multiple chips / irq sources
> > connected to the same interrupt input on the CPU. They are all using
> > level low triggering (which hardware and system engineers have ofcourse
> > been observant enough to ensure).  
> 
> And if not? Isn't it possible to make them share an interrupt line?
> Of course it's very much possible, but in the platform description
> the both devices will need to have the same one, so for the second
> one it will be a bit of a lie (due to an external NOT gate or a latch
> or any other PCB level tricks).
> 
> > Without my change, the mma8452 driver does not support configuring the
> > chip to use open-drain, so it will be pulling the interrupt line high,
> > interrupting irq for all interrupt sources.  
> 
> I even don't consider this, this is obvious. And you are correct here.
> 
> > With my change, I can now configure the device to use open-drain,
> > register the interrupt, and everything works nicely.  
> 
> Nope, it depends on the other stakeholders.
> 
> > And the change is backwards compatible, as you have to specify
> > drive-open-drain to switch from PP to OD.
> > 
> > How does that not make sense?  
> 
> Please, read again what I wrote.
> 
> > > I would accept this patch without adding SHARED, perhaps.  
> > 
> > Without IRQF_SHARED, I cannot use it with the hardware I have which are
> > sharing the interrupt.  
> 
> True, but with _LOW it makes a little sense to use SHARED.
> 
> > > But still question why we can't use the OD instead of PP for the pin
> > > to begin with?  
> > 
> > Because HW needs to be designed for OD. It is perfectly valid to design
> > hardware that relies on the default mode of mma8452 and compatible chips
> > to use PP. Switching to OD will not work for such systems without
> > external pull-up.
> >   
> > > Do we have real HW that uses IRQ input without a pull-up?  
> > 
> > I certainly have had such designs many times in the past.  
> 
> Okay.
> 
> > Why should we implement the driver so that we cannot support such valid
> > HW designs?  
> 
> This is exactly my question as your patch limits this to _LOW.
> And this is a big issue with it.
> 
> ...
> 
> P.S.
> I'm on vacation, but I disagree on the approach taken in this patch.
> I leave it to you and Jonathan and others to settle down.
> 
> Here is my formal NAK (to this form of the patch, as I said, w/o shared
> support it might be okay to go).
> 

