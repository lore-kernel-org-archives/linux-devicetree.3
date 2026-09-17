Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7074F46EF8A
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 10:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789641965; cv=pass; b=b4zmDC5hPjteC7J+adMEMnY90AAv8haT6ANGX7ne6Ox6PI/0B/bRqd+LJwY/qdpmJVztGN0r7hh6XJERvaLUBW4NHw6b2XNwLjOVJi9LBEp8Wq6ekJfOvYk3DVhEqs8sUohqmMf67gZn5lTxqwIq/1PDxkUeji0UEzNkIFWwo9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789641965; c=relaxed/simple;
	bh=rjB+t1U98O5S7Z+kA53n3r2lUUZQddZ6pQVVkPwPK6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gFvrE0jB+g5nYCTAXCNi7LBiCSD1wLCTE+QDp4vMIozcCPuwC+I4MFzCoXTQsFtH54USDAg37w+RFnKafimu0qtYrRFoj35edBOqM+3DIR56avP2o6u9SLA5qwdS8NNlegotnqbU0j6bySQ0f/xptLlgqthyQBm/6mtzdNmD6EY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qYBGoIzI; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qYBGoIzI"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b89a0e69dfso528034e87.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 03:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789641961; cv=none;
        d=google.com; s=arc-20260327;
        b=eom59mQNtlIHrIXKsx+DHzoHnnXbn789ajQJd2q0QX4x59UJGDOsF5Bp4arI19oCgc
         CBQdkTugMSU7qIeWafCJE8miRD6yn65k1dqFwkWQTh1mqzEazYQuMKOP3zsZaMaHJA1Z
         PmGBKw/puilsGSuIJyJZV+N3HAOmwh9xTP6V/ZNTX5dukSEFf7ttLSPsRWAuk6GIOxuH
         qm9u7tQcr2tgL9RZdky7NvzjUaNWWOK32dgD3x+qFQr/x/+D/enPQm225xdlw7mMGqQI
         tcY5tY2SHhVYmAmU/agqHfXWhqt/maXPKTP6ccS3clG0SrokEPDEDQ0qRml5b9NitWav
         mWPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rjB+t1U98O5S7Z+kA53n3r2lUUZQddZ6pQVVkPwPK6A=;
        fh=FN5mX2i+PYi96BOetH3f9bXdVgK3xg+YJThZ/bJNeFY=;
        b=iDvGB2i9vTU1hkd4LMcZijYjmlWGYK3ntcA5S8qrkU0Z9BLqyTv9wCvhupng2Mdoj1
         AY+7oG2+jjdtnVrGB1r9hevdIT2ZkumIRxji7nsR0H6SQZ7qHvaxuHR6D7BVbJhjqG8X
         0IvIEqdGgVAYuHTh1+Y9zX8yhqsHIppDlFZ2obOdZygGuHfBhOhp1zsKfqg8VlOr5iuP
         QomaDcNVhww4bpaEzuLSZMDKmJUK0FiyncmcrWfSlcDQdtL9iHy2KqxOwhAic2rt1U6+
         zUuTe2ZPGjlGZvA7GEjA+vOptTIfw7tzl6d0rzwhYPTSchgK3KU7zdHHdekc0uCQalFE
         KucQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789641961; x=1790246761; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rjB+t1U98O5S7Z+kA53n3r2lUUZQddZ6pQVVkPwPK6A=;
        b=qYBGoIzII+rOKllA1M28S+LTJmlIQVO7+/a1Ezs7YQH6aBh7Mv5L3/RXsQ5Hff0bfb
         lD1FO6CUGhCXA/14XspQXxNX6GkQu44x4T4NJY4xiNpRRGSyS1fcKuyyBdiqqDEkPufa
         ueSl6rWnXGyKJCN6o8DV0vNuVsTNJbS61Zusnx0WZ02dq3xQRrc3wi1PeajQZwmklCQ1
         bJXAqHezWT6YJt18Y6vXrTwiIZ7CFF/6kM/5LNab1EPx4m1mdJF7+U4EbKNC/Or5LHtx
         FM/CO0TizpZM4POxbD6+yaLI37Ba5QbSSD+2SwYl39hhLkUoGjD1rjAlbq4WbVMNMI8o
         ltpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789641961; x=1790246761;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rjB+t1U98O5S7Z+kA53n3r2lUUZQddZ6pQVVkPwPK6A=;
        b=WarLaSdm52yzIF44vJtvWWKjINNRcaiwwCLUesFB1TcZvlDYEjQ2mrEO/9NdPXgh+L
         Vz5B4L0k14znYa+Ck3Oc76PCl5rJndgH8NF7R8p/X1ytPbMrCLXnm8PkGvA3tFNE4tiV
         daKLO9B2Gl1WMFccEmE5IaE5sVmFx7wEvOQgbH0Om494O4c+O+5gokEzWpz2RL/4xo61
         bFezWsER1wn5VprDruP0Y81V0wZHkmmJ5Ms1aEyXgQ+Eez2Xe+fkFaD8053RhLTGE/+w
         W0xzoLnE2zoZ5Vzxaz4EEHa9/rdO3WdAoPPXK859eKpTk7FEthti+P1yzK3LUoqoe8nT
         I3AA==
X-Forwarded-Encrypted: i=1; AKwUvBzZd0VgXcCJljGj8m5bDa9xrTD9yqZkBXhtz8y2dv/XlxtAnjLVMHWBsdM7QWYpRANPnvltMjKCaXEA@vger.kernel.org
X-Gm-Message-State: AFuF++k9XfopN6qox2vybLoz0yh4i3Kr+UkD4gWYseIJp5+nbSIDHE/I
	hiY1kvXNQk4Ov+XV9KHYLvGG3s2rNnoUgKXdYatI4JPlRWCkEeL1tS6kRwLjvtfYduJYcJqZyky
	c5KDtEhtgbpMYaaxpBs7U9XhqGHJf2Vs=
X-Gm-Gg: AYBFou0IgjTHqV2bwwxNshgf094WJldirnlp7inXWi414QlCas448lMwxlqf2ZdlpYv
	1FfsvJkmd31FAv7y28hnjA/cmUR8bfiSieQ2gFSC/Vvze0auZwUZKpRWJkCrnTVo0InScpvvQ1x
	gAR8BdYafUGdqg4frdQWE6IwA45144BSCuCtbEmjC7HQmliTp1ywLE3lvgqAydaknw9lNTUWo4X
	I63wapFmVhKlo+meiiR/DTtxmGKw0neRXdaMnkfwhtz1RxnphSwVghVZsPw8Y/DcKqyC3Go/Mfs
	sSk0wf+nMnAVe6B7AMyPGGB06GAVkG0ez4+2IxR2jTF6wEg9DxE7w/C7TqQRp3u4oxY3506m0kz
	+iTDCFNBQv68QgnG203o5SXbwrvmNb+Y3UPmukB9AM6QX7887/tabXBMxOlDjS7C8M8jkdFSQ1n
	A=
X-Received: by 2002:a05:6512:b98:b0:5b5:e53e:5710 with SMTP id
 2adb3069b0e04-5b8b6612321mr1505509e87.2.1789641960731; Thu, 17 Sep 2026
 03:46:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913205007.118552-1-kieweg.leander@gmail.com>
 <20260913205007.118552-2-kieweg.leander@gmail.com> <20260917-exceptional-artificial-mackerel-0bcad7@quoll>
In-Reply-To: <20260917-exceptional-artificial-mackerel-0bcad7@quoll>
From: Leander Kieweg <kieweg.leander@gmail.com>
Date: Thu, 17 Sep 2026 12:45:49 +0200
X-Gm-Features: AcwNN1VgOhJr4ad7C8peqI6mwIxM4fxg8yzI346q-TZ2yyMIS-0cfhrV79aD2_8
Message-ID: <CAMwcS0gVCD5G+o9GHN9umx+LSG1m7NrNPY17LGVpN1cLOjsmWQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: Add GlandaGPU binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, u.kleine-koenig@baylibre.com
Content-Type: text/plain; charset="UTF-8"

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Hi Krzysztof,

Thank you for the review!

Best regards,
Leander
