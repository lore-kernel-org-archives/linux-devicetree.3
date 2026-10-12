Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88BD4A2075
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819058; cv=none; b=oL5sPQ9ANY9s5Kmbu/n/cSWTZp9ZWIuYd84aGsrtIoeAWccCPhG+QL3w3TDsBSmpdJbvPfumtldy2rqnKJ9zb2RBml+GE8TT2OG5tf3la89KOTuu7TyqpkvIvFME3qkY+vfd4THvng0Q/+t4Vlq9aHLvSg8AJkTpNb9xcTXaE7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819058; c=relaxed/simple;
	bh=72GZy6Rk/xg+Mw6R95RKY9Bd5qAEshpDaKWgQB9kw6U=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=YJLhQjVVHlDqyU2VnXfvyrishZy43GAev7PpAvPXQ9SwIveMtkMNc8mh61rFasFrEt4c0OJlRq0G0X0kSeJkkBc8+6V0erAeLGyU+WpQSGFSCoeGiav5kouS2BS6ivUUDN4otW73SLV20K73CYlxDACkAG3HfnYCyzqh0xa11Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=B0d4C7SB; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="B0d4C7SB"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c6f764f82so612645f8f.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791819055; x=1792423855; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ba3+jNOzbQ3vFxy0wZp3OiJdmmySM4+d1fubwhelRqY=;
        b=B0d4C7SBnifd2MTtv6O81Z+7dVwcF1TGhVN/cM+e+RhnfHxCcQKAGrr5NzlKLF7jSU
         bZmFCeMv9heaf9OK5usqTC9m36v1WrM+OhOFxvGMX1pQGSUUponyW2+6rZNUn8ANXlea
         cwb8E0+xt3CE10CPhICmAcd0u/AUy7WTuad0Emqwim/bQoUakrRab59N8HbOwRjepQta
         JAfgIrjZN+P7/3lJkitqkxZmhg6U7ncXqvHfrg0Vh+JD42B9DIP/AfRc775M6cS1B3o0
         4ubS6w4xm0OaHyQHh6y1XUblUQ2rhfEnwatEckuszov8+lIlpB2VfvYH3BRb+Hi9JNE5
         ZGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819055; x=1792423855;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ba3+jNOzbQ3vFxy0wZp3OiJdmmySM4+d1fubwhelRqY=;
        b=2HZwlGwjyz7xlLoUQjN2k4cI8aqypLOtFM8S5OFxuThTKzxNDA9jUax3s4MPDRhQ4A
         8R8aYQ0t1pxBZiSM7JhaYDrbHwmc6yRjvPLlWJ+BNp2Tb0nQOl8Fv3GE2Q87sBw58Ujf
         T+Lg8dt5QPPmts/Te7mMo4XUmY7mwfD0Hybhevfg6HG51WqRdZScIwiuctQqQR1ENtGF
         ZKJQgPdW+M8nSbEho4jmfBEabPGdCPJJMYf+t51jG6HEH2/nUzrpwzHfscSYII4p1ijh
         7K5w+b0Ni/56e+jyZusrYYsIdQvY4nSR6YXfp/clpt3KYYLQRS8VIB/FNUlnOFv+zAnp
         VVSg==
X-Forwarded-Encrypted: i=1; AKwUvBwQYDxZb0E95i+WS0z2GRSgFkHqMRw5t0SDUS+6FMo6Mxdqu8Z3ZHs/JXyRP9bmK3X1q7hQoBnQbXPm@vger.kernel.org
X-Gm-Message-State: AFq9FYLAH68ccwJsHwam/gGuMEz2qEGXir7VfvKMBrn8aBsBMzytavdH
	DqTygJ9YGGUM6Zp02pesTtcXK8/Sa799SyKoFg5TMzONiAXyyW5R/ThcfqeWwClyWJs=
X-Gm-Gg: AYBFou1x0KrP7hFVulmKG3ELM2xcohuOI+w92Xf/JVCxoIbVLCbKshTvBb7oOFeRRzD
	5JP3wxJrn0I+IDqKZz0YRNQR/A+1mg65jsTvF2tUCFomFituy9v5X3BA+29B4CXZIFtInQXJQ+i
	eg/Avo0PSDKymeE5upTwLatYcYgxoGobEgzVkkIbHZD86a22ZFo1mE/MxT3PwVhSqK5g1L+odLf
	/uAW/wnM5WgzFSNsL65KU0iLw5Je+zjxglpJunM8oC2qn/CY2UD2vS11MCfyCqlSn+mTXfDdZNn
	wZIXmEeValAI5hhxs5rO0mqWkdv9Xxg2ErQFMvsCxCev+RUB6BIdcTxRFMuTdkjp0l7mFopbvsf
	rp4OqxdKIjyrKIPTJ90MyPbtqKdeF+dB5URevg+Qs5kBxKK6Y1lKkPBNyT5UxSz5ShRpmdL23CY
	Oes31LBJFmqgGSDE7Y0nCkgxLbbAx0WsA99GRnfxxABcMgNp4q4XB8B8RsyGjI6LemA89C1tz2U
	ro6eAQSySGFArjNw1vwSr71RX5J
X-Received: by 2002:a05:6000:1789:b0:48d:cbfb:d7b with SMTP id ffacd0b85a97d-48dcbfb0f48mr10990934f8f.5.1791819054737;
        Mon, 12 Oct 2026 08:30:54 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab48a7sm64048f8f.24.2026.10.12.08.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:30:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 5/7] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
 linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <87cxtni7m6.fsf@bootlin.com>
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
 <20261004-perso-ma35d1-upstream-clk-v8-5-e1a106a128c0@bootlin.com>
 <20261004205551.6279C1F000FF@smtp.kernel.org> <87zewti2pf.fsf@bootlin.com>
 <1jjynw7bp8.fsf@starbuckisacylon.baylibre.com>
 <87cxtni7m6.fsf@bootlin.com>
Date: Mon, 12 Oct 2026 17:30:49 +0200
Message-Id: <179181904945.33566.17882786294681341398.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=72GZy6Rk/xg+Mw6R95RKY9Bd5qAEshpDaKWgQB9kw6U=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFln/mpO6fv+//4847fzDVy2+/AkinE+m8ZovlXu7bQNH
 x5dOru8uaOUhUGMi0FWTJGlhrta/J2k1pdZ03Vuw8xhZQIZwsDFKQATMbZi+MXE6pzSI3rfiNlK
 5lEg++Zza0wOKa99OGlj/k0VOX3jiBCGfxqrf18O1HWNTPu74aek7b1y1Z0bEh4fCudRze48UVr
 aygoA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-10-06 09:57 +0200, Miquel Raynal wrote:
> On 05/10/2026 at 11:12:35 +02, Jerome Brunet <jbrunet@baylibre.com> wrote:
> 
> > On Sun 04 Oct 2026 at 23:19, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >
> >> On 04/10/2026 at 20:55:50 GMT, sashiko-bot@kernel.org wrote:
> >>
> >>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> >>> - [Low] clk: nuvoton: ma35d1: Modification of global static state
> >>> during probe
> >>
> >> There is a single clock controller. Should never be a problem. I can
> >> certainly move it in to more local scope if someone asks, but it's not
> >> practically needed.
> >
> > I may be missing something key here but why is not in your defined
> > indexes like the rest of the clocks ?
> 
> SYSPLL and its parent (HXT_GATE) are in the hws[] array. Are you
> suggesting to use the hw_clk pointer directly there instead of using the
> parent data structure as an envelope? Because the issue raised is the
> global definition of the struct clk_parent_data and then its
> modification (since I need to reference the hws[SYSPLL] pointer inside).

The problem sashiko is pointing at is that you are creating a global and then use
it as a local variable, just assigning the the .hw

So 2 possibilities:
* You just need the .hw then I don't really get why you are doing it differently
  for this clock ?
* OR, this is one of the those clock where you want to check DT first then
  fallback to a fixed clock, then yes you need parent_data. don't forget
  the fw_name (which I did not see here) and use a local variable for that,
  not a global

Did I miss something ?

-- 
Jerome

