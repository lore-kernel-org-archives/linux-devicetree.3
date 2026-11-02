Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657122;
	b=p3ijradpLqanlAzif0i6YT84MIMXhLfxRwN/zlxcuKHRev+KlrY1jxPXEGQ7GnnJJoAT
	 jTcz/aKTEUWcMrKuY1Dq+amkOlfK1NKbYRwW4sojKJHI1zziMEEVeT4rbX5s5tJ+hN7hj
	 cVCe0SSgGxqvVeyDUIuA1e1SDPFjYC0B8bcp+P8QbvCAb7QY+3HMk+u9SxmZLSmvc6d0y
	 GoSocST9PnWGFyWLz1uf5sWx3Gw0pS/SufAu32p6uV19Eae04r24nGI1DxOecnAC6HCPR
	 vPkU3d5gpO97VL2R/lYDlvRQ7hKTS/HSqMc40+J97vkBCLKkQKDxT5iHAfhht8o5bOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1X5bXRL8qqmcC6O9ai7+IAT4c81ATWUWkhjo+536Us8=;
	b=D2kPIi6A/AFBKaeSiVwNrNXj5VFkdOouZLRvZLOtpkNthFOLVpawuQi+teRtzcMreVSt
	 8fPzifIpAAvrtAiVOrzCpFdB58aHX3DkfRtLgyeKrS1pEa7uLDHZUU2PqnayS8MNOOhgF
	 vKjuuNkTI0bi0rzTSFlyU6cdnqYblccFRlaLDzy2bIZL6BoJ2R6yabHJRBJBbI2onqlp9
	 X/RScja/D111NI5J322s+1Ox6juQPlkM0VxHqPdCJEnPVv9j4AJdSP18LFkVNmYMIxafX
	 eaitIo1WUweCu+iCe7qs4HVnMm9N9+VABI1DU/qDG7IYCWwr2Gz6fj5tRvp0dgpF4kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PUs3mu89;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1132E6082BCD
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 22:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1132E6082BCD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PUs3mu89
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-369f33df08eso6881757eec.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 14:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793657121; x=1794261921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1X5bXRL8qqmcC6O9ai7+IAT4c81ATWUWkhjo+536Us8=;
        b=PUs3mu89+syzBRQDWzZ5ixeKkYfm7Ii2ag28THP8+Pd9LkZZQOro6Z/HEuWYy7rQEf
         6s25DD6Mt3qyvJ8QfIjMR75zutVoFrxfYCDKAftAiS4v5jL4bj0qUJfNqKmlOqq4zUlR
         RPafHTP0eJY2vVTf9ppyCe+YK8I7tlameB6HcKJqSgVyGEbnjZHG1HK5MEawyr7VMhOX
         8ZTHNrPpSQA5BFgYTbWPLSF/R87ic5NTl3MnIuhRRvJNwFmMfHdviPxnyVboRlWk39Mt
         wghhoMBEaOFeFVHMYbZ2U+snwUafVNI0uu0hGUcxqhrZjFRY9hAWw13syb8TM+TuaWRF
         N4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657121; x=1794261921;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1X5bXRL8qqmcC6O9ai7+IAT4c81ATWUWkhjo+536Us8=;
        b=zEmKADFNHjyRg71era9Gc3JkV/p6Bm43eat5sZARsqLHE0h5yIWKY873an94tOYY+F
         75kL2PzDAbcv/Nl2nyb8oeeKdb7SpjUmaIEHZNdetarkF/192VpWGGW+SOg2pZKHSYBY
         roHTgvWV6BqIlInHdlTV+9j4HDqNerykOF7b+yYUNLEc1WSOWVZTOaeccta+kgVTnSb6
         g1lFNpqVQ4uajUOsMl48pADBXOFJ6El6Cmz4j2HtpYkZyfffUy7OdwTKRhJGvjFPJkBA
         bMGQQVlqCVxp0HmBUgSUCRokbkqZh1iEmc7ZJKi7NWSQvf37YHLo1uebEUzKfHCUS42r
         uYhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOg4ypTwWr8s6yVuxsHP62TaFC9PPhbQ2yqBiIDOiXbWVxP030EYpdf6VUJoMR/eVqUk0GJt8Rn1D7@vger.kernel.org
X-Gm-Message-State: APuU4Z/eEK3NPezsZYNW9y7nqPuXcT8J8I+pBYklxKToU6YCdqsBiGte
	Pt2Jxx7oAH3Iv9NTl7Cm37CK4o3lmhwO2RT4+/A3jGP/ciBU2pF6n3sT
X-Gm-Gg: AYBFou3c41tiT5FMIVzLXAm6M8Af4TY6/DOmJ6Nw6a7bXEzVOtY9Et/wiTFkA8hgLXV
	c0uGWAV8C3A+l9YCn7pBHBE6dWHcl95EwdOLJjRVwx/uURDl05CaRCmWMvTNWliyCCLWH/fA6c6
	Rm5nwPbC8NBlSrzURSLQGhQVC/spVS/+zmWZQtRlfVSRm46Ysz5qpILyvzB2nR9ABvrIiJAvkkv
	nhkXk/3gxgmNDKq9i/PtSu6dMWfUFv0ljBxwWSihY8t4QO13DehyAXLHIsgB7kxqW3avSZfNI4L
	wcY60dkABKbXhW65W15Bjb0AR3FPZt/lialeUDeHhA/hcbbkERoJ6JmVi9tadcplMwqwvyxbvGv
	Cgrba3OhFh1rpfjEgs809PfddVsgN7i5wHm6vb4vNuL1ZJbJT9VvHJ9sV+9WWry5PoOXR0W36YV
	z474wR2cZ4RJf1zSxB5+6bzF0W9j6R0lOHFKXQQVgQfeUHp104542GRJaOtQwBGkHQOdPEGUAl2
	pWqaqq2qk91Rlq/iH3oho8qsd9O3XL0I87coqmueg4u8Tnz3p5GdNZ+NGCSPhTgGhhpdUHIeQsz
	B4CmfodO2mygfBvw4qc4CLonUpS364hrk63UUuEkgUPz/3IkMeChLgjzQQMYsOQIVA==
X-Received: by 2002:a05:7300:3b0c:b0:36a:238:1485 with SMTP id 5a478bee46e88-36a4244276cmr24803721eec.37.1793657120646;
        Mon, 02 Nov 2026 14:05:20 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm42657742eec.7.2026.11.02.14.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:05:20 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	media-ci@linuxtv.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 3/6] media: iris: add iris4 specific H265 line buffer calculation
Date: Tue,  3 Nov 2026 07:05:19 +0900
Message-ID: <20261102220519.1738-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261001153221.4FAC61F000FF@smtp.kernel.org>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com> <20261001-kaanapali-iris-v4-3-642f9ac5e699@oss.qualcomm.com> <20261001153221.4FAC61F000FF@smtp.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 01 Oct 2026 15:32:20 +0000, sashiko-bot@kernel.org wrote:
> > +		dpb_obp = size_dpb_opb(frame_height, lcu_size) * num_vpp_pipes;
[...]
> > +	return ((ALIGN(dpb_obp, DMA_ALIGNMENT) + ALIGN(se_left_lb, DMA_ALIGNMENT) +
> > +		ALIGN(vsp_left_lb, DMA_ALIGNMENT)) * num_vpp_pipes) +
[...]
> Does this code multiply dpb_obp by num_vpp_pipes twice?
[...]
> Is this double multiplication intentional, or should one of the
> multipliers be removed to prevent over-allocating the line buffer?

Some data on this from a Lenovo Y700 Gen 5 (TB323FU, Kaanapali), with
this patch on v7.3 and out-of-tree Kaanapali support. Hardware decodes
were compared bit for bit with software decoding:

                             HEVC Main10      HEVC Main
                             1080p   2160p    1080p
  v4 3/6 as is               pass    pass     pass
  dpb_obp multiplied once    fail    fail     pass
  once, OPB lines doubled
  for 10-bit output          pass    pass     pass

The failures are "session error received 0x4000005: insufficient
resources" with no frames decoded.

With num_vpp_pipes = 2, the second multiplication doubles dpb_obp.
That is what 10-bit output needs. With one multiplication, Main10
passes once the size_dpb_opb() part is doubled for a 10-bit capture
format. 8-bit streams pass without that.

Is the second multiplication meant to cover 10-bit output? If not, I
can send the 10-bit sizing as a patch on top of this series.

Thanks,
Joonhoe Kim
