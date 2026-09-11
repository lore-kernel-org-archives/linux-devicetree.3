Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6374078FC
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 10:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121459; cv=none; b=IOzkkbfHVybUvGZeyITYoRssa/4hEWpv5YXUrnbfVjEKlbRyRVWgFMNGsUnbxDrJrkfule4voeeYZnSJgVBVlnvMiQBSwTYKGX7bX/RYtQUT+QUwy/GBe1ZJ4bmp3SFgzJsxZ0rkPUEaxAUtW0oWbZhl4nMfNClkY7QVu2go1xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121459; c=relaxed/simple;
	bh=1YRDDj3j2Vt1vNRZqhNjgjJMoy05JYx0QLGi7wz+esk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPE9T1uaghARxrYHS54L2GJe1S1Suwd8uOYYqv1DLdMwb/0KjuEpCGjHXIrL+BTMvphVXEuFAh4k1Z6xxNHkwuuYwifsBEHJGwODb6C/rj0pkIrrYRKsD7kToEkwbgRm0oueeBlGSGyJAXGSm/jUWIicDVo4HDWKpwRdJUvdC2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=CF8MyNtw; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="CF8MyNtw"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a99776ff70so1129817a12.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 03:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789121456; x=1789726256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BMUFQ99hb77UHdAvDILnPay4glWU4keZPMlyptDT9kA=;
        b=CF8MyNtwumX/kz/jtzkE3vs8eoW41h8N9BB32tZUo7BX7sWiwGuQpBX6RLBAyh/nyq
         1ADtrDY5HN6eGlNii/qurybYXkXO2UhBDWVDuY1crtxcQ2kugJT/62+SROiSNFi+wQe7
         edSk+/RzJqTNwc80DCl4twdLYt/qPKMSXUwAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121456; x=1789726256;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMUFQ99hb77UHdAvDILnPay4glWU4keZPMlyptDT9kA=;
        b=iL35IUQ6sANWlENUZo04WLJTZBGmonMyUV71cE9+kErA5hjGS42PvBoVMcjRg0EsX0
         ML53dMea2YpFmu8sUw4Gf9jgMb5sgT/jWoRl85H9vBoVWYjSArqjl5JgCRIzFcfX+enD
         9lpDg2i8TtoghtDVu61K2opnUeTeZwI2yGIeK5eeXANoA6tBqZ11ik1uFy0NHW3uLOT+
         DhVrHYO0fRHJgrZxlslpc2661MWEAJZe65Q+mE00oLDcxfgUMDoHU0k4NOcLSb7MUGvJ
         HxGRX656ixsNP6NpnD1R39aRjOEK4btSmsZ7O3HwC/3xv8vT5+vhu3cxxjiGt0HVX53k
         URAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUgFnXH3THjzvHQ8TvhPB1Wbkyrw+sE8VibUO5PCpjhuqM4DYMWxM6DD6eLhBcSyevzZczvGR65dWT@vger.kernel.org
X-Gm-Message-State: AFuF++mjsLE5tYTnXou3DRVxIRl89aDqGvkOkKw90dL1XnlUIVw0I79P
	1cNjPXZ0WQdqGWvkIJh4f2JBsufMW/E63nhE19DXyJf68ZkVom9cvXVluqt5LODrmNw=
X-Gm-Gg: AYBFou0oKRCM88ij6ZQfUO/4MCc2qWTurqrM7BsLzGj6ZKlDVw8x9Tcw353YudwfhMI
	Cb3e+scojygCHBe4qQ22HHoqOGNp9RZ+e1edqOqcLyhJSNy0+0tF3Ng65646gZHgMi7WF2Di6Rw
	eKdRUyBZ7ZSayXujhdGZuMZujeeGdrymeRqsHVwJUNyqsJynoOQDjjtx1ZpS9r1Ms2skwBkw5G2
	VegUk70QFbHJKNGo98VrDYbzvKF6KRPTruySWXdoE0xqKmwl6zcbYooFoDOpYWqs2U4koHg55CG
	7bm1Rx9kH9w1AofgAoXTqgTa14Y5gl2hLT09HeXqe5pnufIaFgQeD15cif1YMvcNN1vjCWO6N5n
	UqzzNFxXdM0hQYeoRzpLfZux/tW1UV7PPPrCjIOeo5AoAHeFfVeb8L+GNqZZmUmhMId1Xuv4b9S
	sdm/HcdLOrejrjtlp0qzl3R9cykxMNwyvFc79WHhA6Vhofm8gp9Wg+zGXrxSQjFY5ttDiT3wWFJ
	DeEcAtnVwKDIvbQ
X-Received: by 2002:a05:6402:450f:b0:6a7:f505:ef3a with SMTP id 4fb4d7f45d1cf-6a9b56c5debmr1418388a12.35.1789121455656;
        Fri, 11 Sep 2026 03:10:55 -0700 (PDT)
Received: from carbon.k.g ([85.187.61.220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b58f8beesm578104a12.8.2026.09.11.03.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:10:54 -0700 (PDT)
Date: Fri, 11 Sep 2026 13:10:51 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 3/3] Add socfpga devicetree for Draeger's M48 board.
Message-ID: <20260911101051.GF722@carbon.k.g>
References: <20260909111513.2259643-1-petko.manolov@konsulko.com>
 <20260909111513.2259643-4-petko.manolov@konsulko.com>
 <0b682ab0-731d-49dc-a7f8-64c4d71bed71@kernel.org>
 <20260911092541.GE722@carbon.k.g>
 <1f61bd22-4e1d-44ae-b4d6-9426fb9dfddf@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f61bd22-4e1d-44ae-b4d6-9426fb9dfddf@kernel.org>

On 26-09-11 04:54:21, Dinh Nguyen wrote:
> 
> 
> On 9/11/26 04:25, Petko Manolov wrote:
> > On 26-09-09 08:36:14, Dinh Nguyen wrote:
> > > 
> > > On 9/9/26 06:15, Petko Manolov wrote:
> > > > 
> > > > +				bank-name = "SYNC_I";
> > > 
> > > bank-name? I don't see it documented anywhere.
> > 
> > These DTs come from u-boot where it is documented.  What would be the
> > correct approach: to drop the property or document it?
> > 
> 
> DTs come from Linux, not the other way around. I don't see "bank-name"

I was explaining the origin of "bank-name", not that we should reverse the
process.

> I don't see how the property is getting used in the driver.

This is enough as a clue.  I'll just drop the property.


		Petko
