Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90457349CF0
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444815; cv=none; b=Vt+uDKnoDkI+Gr6PP+WWLJaE2JIRZ7JPUdHo2IU0E/wEz8SCnh0FcYTB9DkMxtybNEOUu9QyENTJELs4m9DoS+pAVCpTIpZs4A/iaGRLQnemS/p99iNlMN7zaPn061I24F7AVL6tpJWXdVeLEtO45jSETC/6bSBuQ0Ei9VokpME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444815; c=relaxed/simple;
	bh=SRxnNxLvSRz09aoCuYsEnPTx2LdCf1qheDcTlTOHcOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DuKcOE7a4vj176lOInChzRsY4R5Gs4llHPcArY4VN1LoPTd2CQ267rgtms6wTIuq8weWREYKmPIIiMuulTD753e/zrZLkz5ftl8QCfqcMmUNso34GmuJp3EYAHJ8O/X1bCYvD+ryZWGrga6sOObRLP5Z6thWxDG0sw/Ou/QluDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnwzdTFG; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnwzdTFG"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c8028fa6039so4955456a12.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 03:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444814; x=1780049614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oxv8UL85VpOX5p+L7n6lxvKWMwkHziHJ65pdN0X0XU=;
        b=hnwzdTFGWKEhsBgPCNxM6qGgBtpr6ezr+y03UwVErnt91dGn2seCPc4GCQMd2OQC21
         RAajZ70CQ5sRMEhwSBXOe7D9tD/fsqQfjw7uj1tA765SEFe+6Q5A8B/G2EMPnkwV2fjb
         Om/DLM5bjk/rkr73guPwicWwJb82qSu/GWTR6MZTvbLJHi1A+UGkuI7WYd/ms7z1InTy
         GWwNrmLnRA8s++0mfKa2jdIfZm/u0Wy/BgdGUekOb1LdeULIedN2iTbAO65T38eiSv3q
         YCMMl+3BAsyZCnNRhSx0xw4eV1agmhvJNIHZrg/rWWvSDs8ivb4tLLHnUtiWkooe7MpI
         k0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444814; x=1780049614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6oxv8UL85VpOX5p+L7n6lxvKWMwkHziHJ65pdN0X0XU=;
        b=PVUxjiXySnXL3QCZHc/mGtLP9rlAcFNxixwIfZ5VF3JXpoQJ/+9X2PyPnZxbtdCA4l
         TLSv/vA7oPGL/aizvp8bRoAhn64YEK4binanZavkO09c3gMBfz8eaE/g08pWj45zoiEb
         WPVlVG4xnO1fYlj5hG5rAF+232WQ+cGWgwMJNUnmZgajAoQQhxE333xjat/wp7tpZQwK
         UXwOI8EapLbvdEBp/lkay8LD+/L8wK02W0K6Py7TQifSo4QkatXHMdEw96ueVb3Iv+my
         pod9LzULi21XjoDajRwDryJ4Keh7WAcTnxXbbneIxcv7VREZFItzBHUS6Q+bMy0zq9D7
         r8Lw==
X-Forwarded-Encrypted: i=1; AFNElJ8zGFHHiyL3sjerc3jOBQt14+olg6fBw3L0jkorLzpq6k+gk8N/xBxVucts4QQf1QALxiWyIo1+mLG4@vger.kernel.org
X-Gm-Message-State: AOJu0YylZtVrCKyhYqnEgOuIpAufBoa0s3fZbF+QwEEdelqcQZDvgbvj
	UHaaQpehxlTFIbI9uMc+Ib11oJQTsUhVCYnX98rIZXs4hadEv8oUnybR
X-Gm-Gg: Acq92OEwoVrxIVrwdVkQkgJF9Bv8PoABRHwMCaIcxcQg636McnN+0TRF9dag9knuDlo
	iEhezpmQXFRD3YnDvUMklgigJM5yqlkDO7p+OqZrxiA477mn+w2wpgzQt02pg/hPbdmlrz2pHma
	HEtLAjsFzQcB37YxMLVfc0DNoEsh3VeIWCaJfFk738DUSPsLy3Ks9TX568IvdOkQHpjHiSKTsL3
	W6JNMK5n7ROpZej3r24O5ANwdYRhEt1gb8H+NonIZBs+31j8zgZEy85viXkmAUrw6w7688cQ4eA
	B+g1ZTwKtDwJ9Xiwz6lDD5f8l7DDIEfWfm1j8K2dhDlVasVkyIGicxlQjlGBZRV0viUqlrbE6p9
	Nwc5dOxLFiQAxTdrc9mXnwK88c7odH9fav8ehn85RK+dTotKinNfrWNN7qqypGX2JK1Ch5T012S
	kwFoh+/oST3oRFI0oPTcueMjHTukUBA2mggi2qeNElWbpbC7RIQ5zvvUCsOadb4iMKeg==
X-Received: by 2002:a05:6300:2109:b0:3b3:21f7:15db with SMTP id adf61e73a8af0-3b328f704bcmr3288808637.43.1779444813768;
        Fri, 22 May 2026 03:13:33 -0700 (PDT)
Received: from radxa (122-58-25-162-adsl.sparkbb.co.nz. [122.58.25.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852054d788sm1047586a12.21.2026.05.22.03.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:13:33 -0700 (PDT)
From: Graham O'Connor <graham.oconnor@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	neil.armstrong@linaro.org
Subject: Re: [PATCH 0/6] arm64: qcom: Enable additional hardware on Radxa Dragon Q6A
Date: Fri, 22 May 2026 22:13:23 +1200
Message-ID: <20260522101323.31911-1-graham.oconnor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522060645.4399-1-graham.oconnor@gmail.com>
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you to Konrad, Neil, and others for the very prompt and helpful reviews.

Based on the feedback received, I think it best to withdraw this series to
address the issues raised, most notobly:

1. The DP_TRAIN_LEVEL_MAX change (patch 3) is too broad - it affects all
   devices using the Qualcomm MSM DP driver rather than being specific to
   the RA620 bridge. A proper fix should be implemented at the bridge
   level. This is going to take more investigation.

2. The display DT nodes (patch 5) should use the radxa,ra620 compatible
   string per the existing Radxa upstream series from Xilin Wu, and the
   lane ordering needs correcting.

3. The rpmh-rsc early return (patch 1) needs further review regarding
   the implications of returning before full driver initialization.

4. DTS patch label dependency issue (sorry) 

I'll integrate with the Radxa upstream effort, re-evaluate the other areas
and resubmit corrected patches addressing these concerns at a later date.

Thanks for the feedback.

Cheers

Graham
