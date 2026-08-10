Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8398D4248AE
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 17:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786382292; cv=none; b=Jp9G6xzPOHq9caBSG5TZybQxymdrnofW5CLwpWajf3l7kggiTBkqm/f7dBeDmFOWkSAJNq0eLXbw2nwCqzJ8RACk+PYwC6WdFxAnrlJ+20B7IduU9w0yHK2MBT32e24cA4My7/Tl9Mub/DyJ7D3j4yB9gjZ0ugRYBlwJFfJwavk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786382292; c=relaxed/simple;
	bh=Ci1XaFzRBv/qpXZwP21pNljumVkUJ79fkDCBQF3hafY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWt3JOxOs2jPeqZHmBFZ4Atgy9xTvdFZNBKgqQiQjsa1gIy0pzkeU3/qOCv8R2qSR24LnQ/uyZB++AdaRUvBDumZtYqAWEdNPs2Um97vxUjT7Mtmt34HkDtYbg38G9mgpmMYpPZM0qH8ACR48TzmELfWRaXCOskx+PpqNYsXXxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XKoi7lVl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tk5nG4P4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XKoi7lVl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tk5nG4P4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786382290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e60Y2Hd3VNcQx2rW0XYN6hHI/hSb69wpEJYZUkdU7+s=;
	b=XKoi7lVl79VoUOkSHi6ykZuixBJ4ebXIC2mYA2rPo3hPr5fsPKe8mmqYQzCcQlr0D2EPkO
	LSKtlxnst0qNm1P8RnN5WFu6Wcvm9PAZ2LQ5AswLBUfKbvJPNtyfjTOlGOrUND5IbI6vCG
	nA1n8NBrtFD5TLachLd7zWvYpUqLsQ0=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-NaCS5bMpMMCEO2HMaZMlYA-1; Mon, 10 Aug 2026 13:18:04 -0400
X-MC-Unique: NaCS5bMpMMCEO2HMaZMlYA-1
X-Mimecast-MFC-AGG-ID: NaCS5bMpMMCEO2HMaZMlYA_1786382284
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81bee860fb7so60668607b3.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 10:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786382284; x=1786987084; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e60Y2Hd3VNcQx2rW0XYN6hHI/hSb69wpEJYZUkdU7+s=;
        b=Tk5nG4P4jUSvmLWVX4rJqIwOUN1/aEp+++F3gNCKjkD+sCb7SJmiHu9bmz2bd9ktHD
         JxW79x77QlRsd4OX7db3HT3vuqyT4cxRG8D8Nk4p8+72h/BwOyb6VuIqZTDVrzWYswjw
         6xRTS5LQZGYSRiSYTALyh3h7j6sfTBC6sTFSqVrpEvPnFK7/WncX3G1b5lyxRNxM5Ft+
         FqaOH4uCch+hqUF0JKZKnt8bbntDh5w9WWXXTD45kF0Nw7JhrExoJ19C2tpzJGb7x6jN
         3V2VL1ZpIDFRyd2cz9+GL7EOOjVOqbTO2W1iTYhyYvYAF3D8BebURw+WZopXFWrtJLcy
         n9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786382284; x=1786987084;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e60Y2Hd3VNcQx2rW0XYN6hHI/hSb69wpEJYZUkdU7+s=;
        b=jc/eqWDmRsnj76ktvjFPY1ybc74XI9fhBejuxWePW7GDLAA6fTWRpAvxeXHA4m6kv7
         cswTk6rWnJ9YasWjfJnjYnwHq1No9hmorDES2IKWsRjkKvALjucWfzPj5rfHr07ZNiqe
         jGIa7mwcDIJ2sR1FbVRS+miF9ha/OTZtIShNqsMUNnVzP1HW5mR1Yi0P5IjoyQW6ewwk
         soMl4BXWsOHocgemgjhdAG6ABYBoOcz5qkje7WszQyTIme3+fkJLFbT4hwFlEeaLgaIj
         9ZgoebaGSJbEy/6SACV+v84PIuc28sATYmQWbPPHc1NXGvtij6x8+KnGffjEorNI5pdY
         /7EA==
X-Forwarded-Encrypted: i=1; AHgh+RpmWr/zXUvSaIz2SfT3eSz2POrnSalMI+uw01gbJL0vc3MzH4WwlxEQqWlaz0FhhdOGgLHakVxgQOzw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx++bw1czAnuFLuThLDVbc7znl+F5ROAeXo9CYuGqZJw1QtQvwL
	lJGxsPq6BP8xGpGtMtVLQRfogTJQpXwLs28LuVou+o7BEzARCoxuXI9xi1xB0lZSoLbEWtjx6Lh
	i4cUvcwkdk0Xj05cFS0KvUyL8jypXkWc+fAmJvXJ+2HNmTJF1kjYbg1gKDYxHet8=
X-Gm-Gg: AR+sD10WqLBc97pQyCWELp3gpUrIFxa7QC5gffDxjAXuMSkmvX98WRVNiGWBuiso1WX
	y739ibPknfsz6ig/DXrUF+m/AkFgs1cHVbwIzmtWq9wkk0/DEBm9JdeYPVeuXu0jV+OHXLtc5Bb
	7hK2q73JE+48kJ91jvB5yw0pgo9cxePRmvT08TrPTFZ3wuuipgBETGnA9eoPkX2IvsY/sXySJP2
	CdgC7Tn4t3B1ptiayvtiSANTBhZ/3XWsqlHDkD7JnXP6AH+YI4ZIYKmnmnSiiHaW02NOa6QZoKX
	gskQmpMsXwR8MtZuV6lCg+c9UDzg78jTPajfcqYTCc2wYAknuPvJ+wyfcMm5TqA0fUtCQxQBo8J
	Aerk8OMEw+/XsEz78yBSuuz3ly+CFUEJkebM=
X-Received: by 2002:a05:690c:9a84:b0:81e:bd02:b02c with SMTP id 00721157ae682-825728d1963mr135364597b3.1.1786382283703;
        Mon, 10 Aug 2026 10:18:03 -0700 (PDT)
X-Received: by 2002:a05:690c:9a84:b0:81e:bd02:b02c with SMTP id 00721157ae682-825728d1963mr135364137b3.1.1786382283255;
        Mon, 10 Aug 2026 10:18:03 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f75c1c17sm60279477b3.47.2026.08.10.10.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:18:02 -0700 (PDT)
Date: Mon, 10 Aug 2026 13:17:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
	quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
Subject: Re: [PATCH v2 03/12] clk: divider: Introduce
 CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET flag
Message-ID: <anoHx6sbVKn0GVlk@redhat.com>
References: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
 <20260806-qcom_ipq5210_cmnpll-v2-3-cce718b8ec17@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-qcom_ipq5210_cmnpll-v2-3-cce718b8ec17@oss.qualcomm.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Luo,

On Thu, Aug 06, 2026 at 11:53:07PM -0700, Luo Jie wrote:
> Some hardware dividers derive an even divisor directly from the raw
> register value, i.e. divisor = 2 * val, with no +1 offset. This differs
> from CLK_DIVIDER_EVEN_INTEGERS, which is one-based (divisor = 2 *
> (val + 1)).
> 
> Add CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET for this variant, updating
> _get_maxdiv()/_get_div()/_get_val() accordingly. _is_valid_div() is
> extended to also reject odd divisors, since _get_val()'s `div >> 1`
> would otherwise silently decode them to the wrong even value (e.g. 3
> -> 1 -> 2).
> 
> To avoid regressing rate requests that previously computed an odd
> divisor (which used to succeed with a silently wrong rate), round to
> the nearest even divisor in _div_round_up(), _div_round_closest(), and
> _next_div(), mirroring how CLK_DIVIDER_POWER_OF_TWO already rounds to
> the nearest power of two.
> 
> Also guard divider_ro_determine_rate() against a zero divisor, which
> can occur from an unprogrammed/reset register, the same way
> divider_recalc_rate() already does: WARN unless CLK_DIVIDER_ALLOW_ZERO
> is set, and return -EINVAL.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

One of the other patches in your series says:

    The NSS (network subsystem) clock is derived from the CMN PLL output
    divided by 2 and then further divided by a configurable 6-bit divider.

Can you register a fixed-factor-clock parent with /2, then use
CLK_DIVIDER_ONE_BASED? That should yield the same results and it may
more accurately represent the hardware as well.

Brian

