Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECEA35B657
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 03:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790393348; cv=none; b=Bt+PKn3HJkiToX/feCeJU9KstfpbJFwWrK1CZL9G8XJEaqeX4vze0gEMoMA7keHM8FswjYWFdzNNH6JSdmai6MPZi12ZDLTBC+jl9eHErEgiIZm+p6HwaDSYG11IRxhwbxaPpqB10IIECi+GYYvJ6LGJqCrhkyRKihRiNuJ+h9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790393348; c=relaxed/simple;
	bh=Znr7ARt1iJlguBK9vtmL9UXuuyNNrW9/zWqJGcZ2yuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyw/6dpf/hNzD+X1EGZTUnXLO5R5Kb0l+lnObIPH60XU5RGSSdKWlH9k5xBcKg5AhWmup/wloyr7pbeRUcD2ol1AComf/dxpi3U1A+oPz9JEtZcqfyfv8z/eXSnwlhpu2e+MjDbPsQhqKgYRgG9CYMIsUbNz+uNb99NE1eOf/xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUxVad27; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUxVad27"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0bcdf41a3so660813a91.2
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 20:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790393346; x=1790998146; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kiq99/bUySCbDDzsz5gCxAmvyRdZYaOERsW+1tODmAQ=;
        b=SUxVad271vm8DQ0rhf57A/6pZdycksqKKoQVO2Mh6BD8GMeqQZyDA3pH8HAc+9lB6J
         gZ6yTX8uBlXu5N41YGmhp6bYe/7Gt2u0ZsgNA99dnGdVSUrOc/HH8fH7fzQLgwDYNRU5
         NZ/3P5b4nLek2+DfIGWoz0IKhJEjy6GXXRmd+5VV10ikVlE/wUxZrrIN84DBUZvdag54
         NCWtrLZGrEWIGACiPxBK2QAFZNSgF/aw+VwbYQYiHdahkWZY6B9vpwfbwMgI/jzcjaja
         qTKRz4Apl0ktEE3h+F4hM8Z5TPr1MhW1OhzMj1fK6lEzcABkYVy2JaBIZHaPVFSuXRYL
         Gf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790393346; x=1790998146;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kiq99/bUySCbDDzsz5gCxAmvyRdZYaOERsW+1tODmAQ=;
        b=lnzaGQvkzoQkoRtqFyWK19nqXaUH4wW7BqP9K9As/aAiXmluRNz1LmK7DXLsOo6v3C
         5dDNDFDYc/wposZLJfsf5F5aUqO7Mm0m3t1+g52MOMdjte4CToW71qR/4qZulrH8i0BU
         QurDW9aVKRxGyNBYDyygDx/nVUrh66B+1fE4EAK+Yqcl6S2AcILTyzDlTWnQwj87/twO
         Dmlhx4GSVMQVhV0XcCKoMU8YqEXHeB3RohmST7eYsE6vmB5VrcYOwFC8KiG7ORPNANFA
         8okid4WGelxXNjll/uG9XJdV++QceFoZGpfnnJ1ATQhmLJB+Pm0eVY3jemeLWSnLT+h6
         NbIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXCU33kKFXEgm2M72FqMTk5R1BfoRlGzNcg2E49RQJLwZJd8sQhp12NCsd2r0Bnf/48WNtuVkd7S2s@vger.kernel.org
X-Gm-Message-State: AFuF++lAqybxqRboNXd02S7AXlQ5s7yyghrK8QdO6TZVPWDaL/DKWrSm
	LrNbTj8+hfJLLRRMV2l/VI0B9v1qBXQcy0qh5JOeTRYH/OAljDqGA1+i
X-Gm-Gg: AYBFou3DLdemJIVTRmRJr4w0aYsIB4bEDlM0YvlQk3UV3Vh9cH2itVSv76yxJ8JjPdu
	Lzy8afhEZI6WXco46/pgISmZr/fo5985JBav8CH26OxYa3MujXAQbEAc2Wj381BeGm880HiABog
	4w13gB4OKtPotBPVfvsylMJJGSN0G1jdbNDw0h8gyW9Xy52j5gOBczlpYjKDm3r+kQuQwY9HW1h
	xwApCvzrzSOGvyJWBncwygBV3e+MMzjhi7y0kzs3XxE3APfJKHb9oDEwYOXwhMj5I44d7mutTyY
	VtgRPjbL9/vY+wMUIOs+0RSByZ5bRr5MCqAVUCofgUYRWFVPifEzcUxEOARF7qVY1tuFRZ4htnd
	c0eRLAL6P1stlCQ8wkV6uI5c0zgtomaZrlodfzq6P+1WbHovkP7Bxu4uCfsTqyAuXEHxGhejSFr
	KlwdEK5HlxBmx4OTZ3iURwMSLi5LBVKjJYiBmP+QwEdw+Utdah2wQB0Msxcab53XGbdQe6zyD7P
	2UAWwHNv9xWmXwOUOLLVWM=
X-Received: by 2002:a17:90b:498c:b0:3a0:903b:f253 with SMTP id 98e67ed59e1d1-3a09875d77cmr6186954a91.18.1790393345982;
        Fri, 25 Sep 2026 20:29:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0bda430b3sm6734490a91.0.2026.09.25.20.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 20:29:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 20:29:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: Add support for
 XDPE1A2G7C
Message-ID: <3ff0d983-37a8-4862-9019-478fb1488329@roeck-us.net>
References: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
 <20260921065702.93196-2-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921065702.93196-2-Ashish.Yadav@infineon.com>

On Mon, Sep 21, 2026 at 12:27:01PM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Add Infineon Digital Multi-phase XDPE1A2G7C Controller to trivial devices.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
