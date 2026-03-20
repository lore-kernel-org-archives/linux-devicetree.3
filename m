Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ACF3DC4CB
	for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 18:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774029614; cv=pass; b=DPbI4XpW3jUaaPF5O+VV47c3Ap4Jx3Y0UTLjmh9PFj0VOXciu/z+tWFF3FTA9L3St30adln3PLCp/LrMRpk1acjX0Z+1BjsNvwXKqdYFoESNQ2gBxY4XwAanwTxIZ41G9Bpyb/H6Osw5tEXuLR3uTGwScbmJChxeZUF5Ni5oFh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774029614; c=relaxed/simple;
	bh=ohkjhqjqT6w2n5YmDzbpLQP95o/RBsnQKiUzjMDHMj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e9YHO6hzB8XORrmANvidhcOQzquXYjR5O4qT88PQZMOqFz8yoriQXslddSRTxV3zSHttOs5q+wpDQ+dtr5IGaMDk5CBP5fU2LXKKwt0aEpeV0ifaDbV+ASCsH8oDQq82w0DKpFeqfnw3zxvHpcH1gG58oubl1nTT9un5RXhyiNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yq/Mz3xy; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yq/Mz3xy"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7982c3b7da9so24334067b3.1
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 11:00:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774029612; cv=none;
        d=google.com; s=arc-20240605;
        b=D/1C3gzINqQ/oNUT6YvHw8xlX9a4x1l+sb4QzcG/argCeoNnFIaTo27STVqcDt2zo/
         pf9DOUoxSowyX3G3zVirIJD1q7ScMqeB0n0/OjqlCoHqRGVAVmtnusTGvivv8xIPoZbo
         oJ7vwPsfTmCAWjL4iF/VKfAbelpxw155CXddci7js/BAN1PzxHpXdRvZVZkDmqf/hAn/
         jVjTjfJnxFD0JINx4FaVbCPtT71cdJ5I/UHgJXp/l0JBdIm4ZWGZ8xN8TvTLh00Y+jLM
         FxQJmlWLba6Ssz9tisx+baDhICbDNCjPeaykNMYt1O3l8b0MDmaeSGNYItYxMs65Xs95
         izPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AUyOcWnbJWgx5c6HBijQAa/i9ayehaiUfSmClKF7UiU=;
        fh=3e7Vm+Vz9dN/1dB0ir3jgOpeeXl+a89pHCSPJ36ROSU=;
        b=dWOYNyP47kl6+Wmi+IR/5gGI+J7sLCuxvnCi2rdq1DNn3oCm4mMIX2S1DW9b84HCJR
         OlUI+bMs6cRwPnT8mIgQac/D0QY2vVPzwrkjWD5qbWkD0CtUhyh+fnblaFgdC21yN2au
         CO64A+5n791wBQ+PNcycY9CX1aI3QP0hdlr7bTmkADUGm2LgHx20vssifW1cKIVRtobB
         fyUOPoMtG3SHb6adczHKRwaJi+yQ9FbIkZhS7xqzXbQh4RL9apAEylHZWT8lD3MvBdG0
         ri6ldIa/gYSaz8T6xXo1V3nXhWIAfJCX3T/eoQSl57PC3XvUtS7uE547dld8vFMuNo5o
         Y2GA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774029612; x=1774634412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUyOcWnbJWgx5c6HBijQAa/i9ayehaiUfSmClKF7UiU=;
        b=Yq/Mz3xy62STHKSe3U9uMx6Tl8yuXTmScfMJuXUGRWBy1UiHLgrY17Y36MsvcGLEgg
         lDzs0Txh9PoYOrGnSTXi0+lq0TpO5F4NFBk3CRqZBiBErvs9ZN7dgv8Td1zZG/YlsxmL
         T4q9umDqs/zo2hg07vvJenDs37LpAEbrZ3Vunh/2D36VA9kEL9EtaSJciqKuUzR0pDJ+
         43NhjSe8UsEpRsgOwb6u4WSIi3GKogImuD9TVyD/91DjSGXXdWW1svEZsApmvc7tlDkl
         b2qIYGvrQa/RVZTq0ZNlclSPUm2ohU9whTM/Jr6j0O9joMqLc1MuOQf0eBOlel9itkHr
         PhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774029612; x=1774634412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AUyOcWnbJWgx5c6HBijQAa/i9ayehaiUfSmClKF7UiU=;
        b=JVnYqLiChb3vNQ34JF0qag5wFJPcYKAgbRq/C7IHFTjlGbqZTh3WuBdDK7ZtM1FXRf
         3XRSS4JnslGBjXyZKXjzgocnqnnT4EO6bPoJuEPECT4LEhI8EdWVka0U+BVsDITEKrOc
         nkhIr5uXWUsPMsk0Izs1vvXGhf+Kr/S/hO/ZfEdhnlVwnA/tQUIEMwFnW5VpQpisUr8V
         zHDzFSuhLI2F1CCCLaxlpLrpMOfC7HasTAmjabHJFmzbkvw3JZo4ofcb5ME+wSC1y1OK
         mSytODFbxAPCOJJyJo5yJmmaezEaDQQqHZaiuY5B8gTRGUR1Zsc1FT2/PzVFDAVwm3Y1
         MYQg==
X-Forwarded-Encrypted: i=1; AJvYcCWtUKUxby27qXRmsGY1qqS1d5z+lSX/I+NDruqsf8axVE6mZBzSzOZVtOVF/+k4UtElzR33KZXP4nBx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8XjsxHVj3KQStXYnshE+KTf2DD73QdIdMS68dWsZCMiI+x79t
	N8BsBnA44I3UpD1MTkRrq1KcoIoynGpvULs8lKJ6lxClm+K1k5VYXivHhxpC71DfXu4Wu2FFxvn
	Eiu932pqaDsbBAZo5ctyxbALSFc3dKQg=
X-Gm-Gg: ATEYQzzzWDzcd12HY95nTeHraI6r0MWpCRJz/HDDsU4mXNhQA1J2JpKQMIw5UtSBug8
	fzZGuhHlBFe7ZdeaT0G3HNFOYd4/T0EHR4IcVlXUFDGDg86lPBGmYbywYzEKCMh3WxPg3Dlk6jH
	bRl3q45L0lxnD1YD59uJClB7souBC+1Xp391fJGwL/YhhZfG7b014uSwDeqvxni/Pym4fegOKy+
	dX6e/jzhxd0IiHyC0kpdvh62Nb19BrlOgN1vManLSLtSn1dezYfGrTYpgI9DznM6ByIxreOFPzh
	HbEPdh5bHkgzynvlraSWTkTwy657Wqy0a4E+stu5
X-Received: by 2002:a05:690c:6d81:b0:79a:1f7e:fca7 with SMTP id
 00721157ae682-79a90a8e119mr43418697b3.12.1774029610924; Fri, 20 Mar 2026
 11:00:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260315080302.454233-1-challauday369@gmail.com> <5731aafd-8a72-4a81-8a0f-04c1ff5b69f1@kernel.org>
In-Reply-To: <5731aafd-8a72-4a81-8a0f-04c1ff5b69f1@kernel.org>
From: Uday Kiran <challauday369@gmail.com>
Date: Fri, 20 Mar 2026 23:30:04 +0530
X-Gm-Features: AaiRm51uWXY3iX9RFYeY_XkgFhe97IaD0Tdgp6FJC0Q_yM_AH2B-p0x0F99bSnc
Message-ID: <CAAj-GB=1+sZcw9jomC9Dsw8ojyKUs2zahpeXt7VXoXE8V4DK1Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: mediatek: mediatek,g3dsys: Convert to
 DT schema
To: krzk@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 15, 2026 at 7:55=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> > +
> > +  "#clock-cells":
> > +    const: 1
> > +    description: Number of cells in a clock specifier
>
> $ git grep "Number of cells in a clock specifier"

Sorry Krzysztof, I didn't understand what you meant. I've tried executing
git grep, but there are no results apart from my commit. But, I've found it
in clock-binding.txt i.e., in clock.yaml in github. After careful study of
guidelines.I've removed the description of provider properties.
Please let me know if there is any deviation in my understanding!!

>
> Read the guidelines for GSoC contributors I posted on IRC used in GSoC
> and/or ones I wrote on social.kernel.org.

Thank you, I've gone through the guidelines once again and updated the
changes.

> Your mentors were supposed to be Cc-ed here.

I'm part of the Linux Kernel Spring Unpaid 2026 Mentorship program and
I've already Cc-ed Shuah in the mailing list.

Regards,
Udaya Kiran Challa
