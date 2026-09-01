Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC23C39C00B
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 14:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273078; cv=pass; b=Nb9+vKiVz21iw93M90F1qIbbJLoDd3qc4K10hVfbByMWB8vZnzF9FjyTWED28W6B2ln3iHQpdsnWQa7B861UveUgHQXWp0PCIh42BgVjYqO96CxQTFgxevVcf+2q+uqZi0aoICAW82N8m9/lT/2S0zY5HLYT3J7mu4LRl1fZN4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273078; c=relaxed/simple;
	bh=5JCE49kjhVD4CKDJFuR7VYFhCbO5kEQuzu/oho0PrZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWQDW8ODMEGz1O220OffsGQ5W6dzP9XcJq9B2wYLgI3pcdM9OkQzBsEcqes3TFc2BHsZf9WZod7+FU/2WrxVli4ncOBpwMivmrSpvVg2V3KBfxrG83qEFPqqWJUOEFi+EOh5BS9QqSKa4ux3tFAPQWZw16Kp9UibH4ppnY+PN8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ra0nvFJa; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ra0nvFJa"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c25099bb1fbso128448866b.3
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 07:31:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788273075; cv=none;
        d=google.com; s=arc-20260327;
        b=Aoaz/FvXi2SGB7E1x4bw34GcIGMLVfMcOQp5pJMVWfN06d5DIQZCDWvrusmJw7OugF
         G3K/3kl7JWAHpf/dHzw9ZtEU8zB5UyHtj2k0LSegsY5hmqEAGRKPvl3LWSeIQ3QxrmSl
         jhhKvu+Wr3eoFMmPWSoybI+o7ugRBaavcG+Uno9aW8MIbUq4x+KB4S1rfL5aUHb6SvIK
         I4ful2QsGkiF3hr4FbaO9D9SXLrp0P/jgtPyIej64WjxoBVDlUpa3VR7ZF5BGOm19ScQ
         Pcdlq1Hxb9b8XAOcnybv4BWMNax38fzc+AQGcwxosfLuhQj996qaimJVoMa8IrTmL41k
         hEKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x0lgToU+YU3Inc+G+YzISxuhKl/BOokX3QBBmgvrxTc=;
        fh=YNC+GIdwtIPGu89y5Px5TQiUg3icNqWTzAhpCmspOP0=;
        b=e0JCIzmlCG1NnzB/a0N4IfOovqR6u7fVMYKl36eqqdWM/SB/nZRejla/Aoqv5wxCpW
         weGa2RZ5/I6A1UQx4tSAS3mQyMWB/t4mO5lc7k88K+fd9SFXbCamr73jyt/cfj4iNDNd
         1mXsVev9E8vJ/kQhLKyAkWqcdRwGl2c7thNMvLvEhPbapg3n8euKIzMbAlUyR9Q3lM5Y
         1HApZ/HFG81mwtNTBcp8UVvY4v5dmKEI7FunCF8oN04hBbnozweC4cO3XC4TVfV3+WvJ
         cHYF14XmWZIKQoHuNC8SwwsyCjc8Z5ymMrnaMyoG6+tCos1vd4+cXG8CDd3ztW2Vw1mI
         R/Iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788273075; x=1788877875; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0lgToU+YU3Inc+G+YzISxuhKl/BOokX3QBBmgvrxTc=;
        b=Ra0nvFJanSQ7SkN68JImzqcpaOmtuEL15S+/IRDIAVmT7x/rTpvhfH8yKuqsqtVFKq
         QTAFGWPmu0fk6JczX285Uryl2flqajJ9WjERZ/sJ2lV+/37uSniOxoXBndM4IzNC1tuA
         qsT5IHLkXCDt9/ay/2//d4DFVQvsjTfa6iufkPv1gLiECG6xcHMC3bQr9TJM6qWk+3zT
         c38gYxIM6UZqWUlrbG3EsJ22x8sQIeTTKseBWou/Nok1r5Vavd45oNMVu0ahoZ6kVzLT
         vhWEukICnaWe8mpItmxV6Pt7f0qTOFqAbEehcJgR6gt9gj0epqs/jljEU6JNsYJ1/NHQ
         adXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273075; x=1788877875;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x0lgToU+YU3Inc+G+YzISxuhKl/BOokX3QBBmgvrxTc=;
        b=I7PFwJ4kTZGcvQru7Nt7BKcmEHtv5d1XWa2u18g/Pdob8/pcPWXMNtvYUgDBon2boX
         LP+8uV8Vf/pW1AY84Wk8lLPS2Iz/7XwVZvT+FMZ7diQuTGqBWI/xUAxe8X7IJhbO2tuv
         OhM6TA2oe6haxMu+x4KqU24c9x2+2+YznbMDzdCF7U2KrhEIwJWdqfDl0My0ycLqNw3j
         CB8tx00RZF5P0mxFQmhUyQt3JBhO4QzeCzF7tHyOaYjPOM/ulfJ56JGLxccFCPWBiIWC
         HtOGSdOZFnIpEo6QfcLhMlad8S9EsQbH0Kv00IcXO1c5ZSxqWvu90eDje7qDSiFxEMcb
         0gUQ==
X-Forwarded-Encrypted: i=1; AHgh+RpU42qgaF/K+mKXrDOKEFDdOe8m5vJoLxy2DEZ6MXi+L/0RlbRffZ1bOoEc0k9wTbxsOHeV0seE6KuY@vger.kernel.org
X-Gm-Message-State: AFuF++lbXM+o256VjzLaMZ7gC/OXXBIGRq2sbtvtX+DFfdNhnbylCMPf
	yyHW5RByiULwtiiWqDX4QVHN9eUieEZlYJIZjLH7DS0YgsPTUr+ZUur1ffdDFjgxqe9LQEv7wUa
	oDpgIfnqeur1JSGqrV7K5rhv76iN9cRY=
X-Gm-Gg: AYBFou1LvdfKR4v2HF9bnXW9GSZIubhzXeYsCzEbqCwWCfJPvz3rhhFG1L/tRvwjHC2
	qGISiM85gG5Hfmk1nRIcT5vJ1Oc6sUGhuqMHnTLyeeHa9GKG7e95U7mR0PJx4V7L7UfmwkVJ7rV
	AwH0AhjmdqKJm+2lS1DM0zS9cnay+VhF39LEIzwedGV/9eDN2HTYTVitwYWJ/qZvEzpvrslfAnG
	qhqsqtWVrLg3ixa6MLYaPD8LETK4S19mq01YtYW7tD3RvomfUYaW/MJhfT0nOanPqYBYFVGfgTl
	6YgHn1MdWw6i7WK/zqhbBwxNCbVuEz8UHyQK6i/SPvJcEG32tYb6HM2fLIEHonJAaIUELbPxWs7
	Wxc3Vld/QDIBBZWRj9Q22AX5gWR2q539cZjk=
X-Received: by 2002:a17:907:97cd:b0:c20:1c9d:8d4b with SMTP id
 a640c23a62f3a-c2556bad5d4mr1984246166b.2.1788273075015; Tue, 01 Sep 2026
 07:31:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
 <prxk6xpxeoebz5da52a6bjgmaaop6mj55eemxdm5cjxm276tyi@jfeziqcrxtfv>
 <CAA-+ukJWFm1YOoWTO5TmuF8ymNuRGtsvOm4zruwUUEGpcmKNjA@mail.gmail.com> <as35xamspfwpmbravcz6g4miz4nfotgsmg5afchgudoh6fd3kz@kbp7kotpxyet>
In-Reply-To: <as35xamspfwpmbravcz6g4miz4nfotgsmg5afchgudoh6fd3kz@kbp7kotpxyet>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Tue, 1 Sep 2026 20:01:04 +0530
X-Gm-Features: AcwNN1XCELOPcPvrH8u8ByY6Rzj-i1F5LZ1I1noSysoUtzBHJi3bLNMYR8sODV8
Message-ID: <CAA-+uk+k1sy1oCu8KiRod_MHWOPDzpQiVnD184srzhSggYZETA@mail.gmail.com>
Subject: Re: [PATCH v9 00/12] Add initial support for Qualcomm SM7250 SoC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org, radu@rendec.net, 
	taniya.das@oss.qualcomm.com, danila@mainlining.org, davidwronek@gmail.com, 
	mani@kernel.org, robimarko@gmail.com, linux@gurudas.dev, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sept 2026 at 19:51, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>
> On 26-09-01 18:22:34, Sreeshankar K wrote:
> > On Tue, 1 Sept 2026 at 17:32, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> > >
> > > On 26-09-01 09:24:35, Sreeshankar K wrote:
> > > > This patchset introduces foundational upstream support for the Qualcomm SM7250
> > > > SoC (internally codenamed Lito).
> > > >
> > > > SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
> > > > octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
> > > > and 6x Silver Cortex-A55) and Adreno 620 GPU.
> > > >
> > > > This patchset is organized as follows:
> > > > > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
> > > > RPMh clocks/power domains, GCC and cpufreq hardware).
> > > > > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > > > > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> > > > interrupt controllers, clock providers, power domains, and reserved memory.
> > > >
> > > > Dependencies:
> > > > This patchset depends on the following patch:
> > > > > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
> > > >   Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com/T/#t
> > > >
> > > > Changelog [v9]:
> > > > > [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> > > >   Make all clk_init_data instances const across the driver.
> > >
> > > You sent 3 versions in less than 24 hours. Please slow down.
> > >
> > > Give a chance to the reviewers to have a look at each version before
> > > sending a new one.
> >
> >
> > I apologize for my actions. v7 was the intended new patchset. Unfortunately
> > there was an interruption during submission of patches, only 08/12
> > patches submitted.
> > That's why I submitted the v8 patchset.
>
> Yes, and now you have sent v9. So even without the v7, you still have 2
> version in just a couple of hours.

I will keep that in mind while submitting future patchset.

Thanks,
Sreeshankar K
