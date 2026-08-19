Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3366F3515F6
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151153; cv=pass; b=gM5HKNo9Jq+mnZ6erFJVRaxmV7x6zBRJxtPptTB4iE0CIbsKby3TBA4KLKowUgl5m+hzZSWMgSe3ELz5F/BfAQyxCmUqZ2CZgk1C1PjU8oUjMZ+pg1EoguQ2geBKR6xn6+qBimRDZn8FK2Nlv9B+Oqh53oREBYnMY2McLQrP/oE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151153; c=relaxed/simple;
	bh=bQVg3/uZoDN7rhrUQpPWCstb5hJMm7Y7k6wHsUPajZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DyiRx88fJXxL5+PCHfVnM6sevLtPGVK4n/df5koVHY5y2KcqSVf+NojZwjvxjRbF9zPO1G7lDhUlN1zPm6v+4SV4qMyOfYbGaJ1WWaeGh9tYe7EGc0RlqbCJEPTNRd3xpFJJEzbWgd8/T9Scgl/fTivrXOhStQYA7flNIy+RuIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oFn6c5Qg; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oFn6c5Qg"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-52b3934af3fso9861441cf.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 07:52:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787151151; cv=none;
        d=google.com; s=arc-20260327;
        b=TAyWXArmWm5Ao4cOG62rB+2nadlTcAeAGqnK9nasJQrc57PQRtZAaEpxxVigAk98tO
         zcmx97eASV04yQmnbtnFvLL6pCSOBc2F5V54jd3DPrq5+nFl/+V3NLWqEC+0dWL2GQ0S
         tAummu5x8jF4d9YsyQwjQL2c++qGuFiZE4EP1wYJNdwZjP9pYk8sXosieFWvPCS1VAIZ
         iztOgyW7q6GYrAm3UEUwKrNNZpEAi0ci5kc68+SDVz3ukEZj12I2ae/hsHdPjNCrvY2/
         Tx5J8Vj1w3faRDNF6XHwsIEt2MaQH42Cqgdk6o9xnug4MGW0dmqJxeLKKFTujVgqYW3m
         x7zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+xwbmX7UfgLnx2SwFFhwr5+els4MKcBZYG6MEEMB/6E=;
        fh=9PPb6BmgX0SfryC1+QiasQ0j5eelFbxFwZQihSdZato=;
        b=k/2rOmeLNnlFl4X8vU64JBd+XvgsrgAFTR2OOOJRTedSrEk/XXHo/q9JUEBdvjXz0B
         0qNWL4CdKY/bDyHPMfWpZTbs168meZSNNCHACnXvDV2tgaIVVwrXsC0FrXa6D9EKzwME
         1AMc74zthJ/mR5Mssx6MdEzu6j2uO5u7Gz/SYiP27ltHbo5nLqDRa3ywkIwiu3lqM6na
         dEv6wYJF9ccepGCaSc76GrEf+y19oVQg5sPtPHrWHd3PviGfLKiOdppbLruCjrVpP+Bo
         U1C6Svbt+2E9+8H0y9KngyconX8Fpvm4oDYrkxrwpGm+X3BAL2kuuq4iB+ZWtDjuhEcl
         jHtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787151151; x=1787755951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+xwbmX7UfgLnx2SwFFhwr5+els4MKcBZYG6MEEMB/6E=;
        b=oFn6c5QgkZ1757/ldjs4nGUVRF13sPVRfP6+EMQfrq4/77Jox9jSr4hQAgkQ5Ny/xB
         +9/oFbTFFn8PNAK3GNUkyUm7YPV1mi71JHyM86CrJP8V3xXeX9LaHNZQyFf3a/2OlvMo
         nsAzyEkxs72TuvZmGnsocHY+TY20XuJE7UwoLCk+hsfR6DJxr5dmgEcW328SSSavJqhD
         FbIeULQrGPKMPKDwzc3cgs35haPFFssA+OYeH7bKw9imEm0SQvDS8GMOkh8u5isl0+A6
         BdNSOLal7wALcoAjdcwwyHw3JAu4b1/tax9EwphY25sR0VhsJv9EnGfIpWnt9rA31wc9
         rSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787151151; x=1787755951;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xwbmX7UfgLnx2SwFFhwr5+els4MKcBZYG6MEEMB/6E=;
        b=Kf2bSv8MS+s5lAbxYeoPteHV4iwZxzAXIw7MGwIzNJWDj0D9ZqRlGX2OIkaHP2kUv0
         Gfzu+l41tqSXunuCvAcny4mXbzHeqB1DgKLvTj+Evrsyy0t42K56kI2DgZTF/bc9+Vub
         Wu4nKONpy7scG0fh6N439P1KYlMZ8yq3HwVW+QEowg1ycrJSNJTOICZOx/n8BrHRhhug
         fccIr1/zu5eiSHs/LX+EsrbolipXfKf8T8Soo4w6iW2NIxBfv+AoDtACqtnfKNMLAXhO
         Wn893YFnMLrra16wqsyPstOZDUTO7CBgJPTk8nvxzLwp2Gdrku/pSGTVGLX8Xgm7mpAG
         hjYA==
X-Forwarded-Encrypted: i=1; AHgh+Rpg0JfIPd+fHzLev26TruYFnQbnjA5RS/Fcu3OXHXDjlWF7w3gwbGJMRa9z5oDQSK79moMLsRWGUzfq@vger.kernel.org
X-Gm-Message-State: AOJu0YzVobdz4YljxOrj9M5LlKOxpKqP0SjV1IZgCGS1WvWJjSn79D/b
	GUedgzelraTs5RjnfgUO+8kbdresQt11g9IDEq156jWJ3aM+W+PZ336Px/4PmBIelrIRiAlo0UP
	X8VD7v6Ad79VDXP8pyNN3Y9dmxluwitA=
X-Gm-Gg: AR+sD11YpAolw7ayrFiGCK/qw5Cej2W1y2czFwLYChyvyNRXec0SHu1Zb514K79Vd8/
	Ss2Xt9mAPXSet9oF8GRwfygNL2tw7mE4GM2KxrgPF+QS9yXomzIHNu8DBSJHLKVPn8GfM3EPO5n
	lbNadI2NU8TwTDJRQCZ/gSsF74w/PX0+3rh1MnXwmm3728b9WaXwd3qKsibdi3IHkXAHJV/524z
	aGaTRHCyqwY/cA2D82p+l5wzszP/GG3+Sp+1ku8NI94etCFd5wCwPJQ+SS2zArbwSU9WFqE7VGx
	50bBpipxdamCuHi6dV2nadXp2nijQ6kn86VhsxSDBUPFA4Ydf3Vcq67fd1Fx2VOatYm89zIRSd4
	c7GvRqHKy263uQdwDoW/Gz/idriblSZs0Db/X4YpfuxM1XV6e+dO6OvjUxYg6q/I=
X-Received: by 2002:ac8:5951:0:b0:51a:8b64:69e2 with SMTP id
 d75a77b69052e-52dd575a1b6mr40323071cf.7.1787151150885; Wed, 19 Aug 2026
 07:52:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808172211.137577-1-jesse.casco@gmail.com> <642652c2-af5d-446c-ac1a-8099639c2588@oss.qualcomm.com>
In-Reply-To: <642652c2-af5d-446c-ac1a-8099639c2588@oss.qualcomm.com>
From: Jesse Casco <jesse.casco@gmail.com>
Date: Wed, 19 Aug 2026 10:52:19 -0400
X-Gm-Features: AcwNN1VqYIJRaj6NXPh_Qu65pGrQ0AJQ_-ppLD8p4Fph7-SBSWW4rl5xU6O8o0E
Message-ID: <CAEaxeoQUZKnCQPG_W0B77gB2VfC__-t7ZxY0mkVsqm1Q9pk6hw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: glymur: use polling mode for SCMI transfers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested. Everything SCMI-related was already =3Dy except the mailbox
controller itself, qcom_cpucp_mbox, which was =3Dm. Built that in,
pulled arm,no-completion-irq back out...No CMD timeout, no -110,
cpufreq comes up fine.  Looks like exactly the timing bug you
mentioned.

Keeping arm,no-completion-irq for daily use since it doesn't depend on
build config, but happy to test more if useful.


Jesse


On Tue, Aug 18, 2026 at 5:29=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 8/8/26 7:22 PM, Jesse Casco wrote:
> > On glymur the CPUCP firmware writes correct SCMI replies into the share=
d
> > memory but never rings the mailbox doorbell for them. Every transfer th=
at
> > waits for the completion interrupt therefore times out, scmi-cpufreq
> > fails to probe with -110, and the machine ends up with no cpufreq at al=
l
> > -- all CPUs pinned at their boot OPP.
>
> I'm not seeing this issue, but I heard others hit it, possibly due to som=
e
> timing bug. If you set your kernel config to build all drivers in (i.e.
> change =3Dm to =3Dy), do you still face this?
>
> Konrad



--=20
Jesse Casco
