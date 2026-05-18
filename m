Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230A31E1E16
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 03:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779073479; cv=none; b=DDoEC64NPCGrzp6x1eL2hfmc4IunsBxssNCuvx/TOvKJ9FhhG04S+mEbWliptUnQG5FJ+A9zdxKCPPL+8Q95ddlt+n/TDY/YH6oBcvJNqNauxztibgHc//+FfhxNVWcSI6M5xJ4vw0HrdgjGRtgjidHWEpKmciVQA9SUYO3HVUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779073479; c=relaxed/simple;
	bh=L1W21s+igUM+0HjpNFPvggeHHSVzWbXv8wXR6Y5/6BE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eOwZsV+me0HDV5a/3ZgF5xLeQoLvaYoPBT+3oWBNp9Cb+d1AP4LSSMlWAPNUCGtw2OEw6K5tly+tXdbDPkJxhNqjKsxevBr3/Ul1QAV/sPb8mzWZmzs+22INs18dqWreUciTzNngq3rHcFq/NmUcmrqA7f00kuLrS6sl/dn3z/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzfX6+w+; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzfX6+w+"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c8015bdf1b5so77437a12.3
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 20:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779073477; x=1779678277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrxjtDTNgHDLtXt57ombRVo2sbxeJ2Owhr7VJ48SGuM=;
        b=YzfX6+w+8KwUGNn4kSpomqe9skrEvZ/CZeq8U2G9foYGexEuyzLxnqy6CHeE5vjw7a
         YoM3PH6Vp9prsYvOhxgDiCyEL8PdPeKteXC0uGWjMgtk3TqFvUVHVNItYLG27lp66jI+
         dgWBq1XH6/eWTZRXOkpSwvtMFxFNR/KUW7hmCCdsyIElM3jZt945vZv7+rcwn9bcwErP
         EzY1YTSfiCRqTNGYSTaMBq6spCbfIjOa5GtXEkSSP/TWWhX7IyrJ8dRyUNsBWmTl6KuS
         D2TFHcHx4wRMGpqNs/DpCyw9KkABlQjNYOY740w3FBbSDFhBvFZoimCeTpJ2dLoqZsFq
         /zCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779073477; x=1779678277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YrxjtDTNgHDLtXt57ombRVo2sbxeJ2Owhr7VJ48SGuM=;
        b=ki7r7duFU53+hm0loahn/pXUorJXqaWOHH5hCS7rdrWu5G0vSXXQ8h5RkHUao5h1U4
         qvFaY2CZ3InPSv2ARyjYf3+R53BeMUF4P7s2+qCWwK6Ogm6yo8kpx5ErDtyBS7jpAbDi
         7U7vOtHlYe8cdOAHsK0QHOer6I316b1BLKCcPYL15GslqlM4n5hsk36RTzD0BPT0b3bs
         eu4LMwd9uLeeQYmTLRfWpSTTOkeVDLX6TiU5lyahI2VVQTiDPBK4uLJpT+HVGJtW7T1L
         OG3KHmgCImVmRSZPhK5eNK4kJo5tYV0KSmKT/pVj6jhjlFsDpYOGxK9tYcGyxhWvZfLZ
         ZtBQ==
X-Gm-Message-State: AOJu0YzH+GBxbKUOLGCi6q9xii2ALtB2qFDHblhVicYz5y3zLl8M/Kyu
	BVkOof8Jrwgd7g2gk9+m/VtyrFwpnxmlm1e/4JG26GslpJbbkOgrXxWS
X-Gm-Gg: Acq92OELGnff9sxgvW8mbAq8W0VcUBtDDtc+7a55JClJdCgcruBsV3An6S0Dv3CZGit
	3C+B1O5jJfpV2OLLOBrLzIxI3wbIhpWXR3cbPE7ow8RvwAg1NWtu6SRRrpUBUD/UmKugTJUJkLH
	gxg48xtAMJG6yPc3eYa70YaEPMJRatvEwndrD3Sim/t28GWH1lncIic/6XNiv3W3sLpnzaMCR6o
	IKycqUTPHUzkYa1Ooz5DHS/Vo18p1mylW0RG4wzMMLKLNEvv2eaidaoFrstqmG6eUpeUJbx7BO0
	vmrqE7LRSOyh7AkTVq5c65Rr5oc6nn4yg3Y6dXADL7OsnB0Hsxxmf1Ppsy8tW/CYYP31EicP7PG
	nY3Eqv4ZSozk5d2daU6jK0KScXcKlIusjMX8Fz7Kd6CpD01gnjKY9qlry/dox1V5ThBgILs0C8j
	7zBVQJ2BMhRHDVgDHXzEvMqA==
X-Received: by 2002:a05:6a00:39a8:b0:835:3730:5731 with SMTP id d2e1a72fcca58-83f33ad5901mr7794512b3a.2.1779073477458;
        Sun, 17 May 2026 20:04:37 -0700 (PDT)
Received: from marchy ([2405:3800:84b:d130:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19776733sm12637117b3a.13.2026.05.17.20.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 20:04:37 -0700 (PDT)
From: Adam Azuddin <azuddinadam@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [RFC PATCH v1 0/2] Migrate RAiO RA8875 from fbtft to DRM
Date: Mon, 18 May 2026 11:04:34 +0800
Message-ID: <20260518030434.431556-1-azuddinadam@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260505122636.11859-1-azuddinadam@gmail.com>
References: <20260505122636.11859-1-azuddinadam@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

Just a quick ping to see if anyone has had a chance to review this RFC. 
Any feedback or guidance on the driver would be greatly appreciated.

Thanks,
Adam
