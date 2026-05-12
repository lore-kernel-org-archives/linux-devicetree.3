Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EA63AB48F
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591708; cv=none; b=pwShiwcgg4OeGBD7ggko0XIVTl8ANKfCOhNPO5xJ2zxnaq5ZOrzTrphmffjQaUm6ODwjIZ1AfkUV0WpO8vNt6iaWCrCXfkgluiHKdqgNvIpQG9HPc2lZcs2rDoqOQuyZY9KQhyafC3iC91gvBf6s6CGfV2nXuP5Tj5cOkZ/Coa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591708; c=relaxed/simple;
	bh=UdhDF60W7OlDKgfHvYMjS058aTau6Jx57vQPbBGMicE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mQ7B7ddvLB8N9ydoGWXnCt69NXgsKRvGW+czDl+bZLraWYWSqLdHTq84GTDb/0TnpcFHyGE/hwL0v8zzQN9O8Hbp9F01qdsDZBlJuDp3a+5rkaN6lAQ/tX+OQsBVmpkfUtHtfpdgD5qcwpM0rjINhK96H6ATwMxpwZDKNi9ISKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nXav6Ief; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OsJilH4/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nXav6Ief";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OsJilH4/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CBcpId075277
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gviVp5L7af/O+n1zHDTS+kpbHcxMBQWZhNHMsNPUGw4=; b=nXav6IefheO4lxx/
	4F5ZNslR/5lY+HGOtjLltipoLGnNLnnpF5bpjMK4wajefMXpNtZCvt9+2Evt2YwM
	+fubakTlYHKWjHkAkjTWx3laszbcdR+DRK20HaBwSI09pc6rg/Lc6C93gaSVAErP
	06K9jgvsDYgC1B9qAR1ru7KEy9t5M16wrYhZyOG4k7dtYnns1BFXZLT9SZw0y2Pm
	visPTG0JB55kY6xOdeo6lVMf9o2C/WX2P6lC/HHGD9cPISxbu1Vcsdf0gbdwmUOW
	PyL//jmaDbGuN3dqheGZbHOoyR+6SH7LgzO8SIB3UtAvWeouVh93xqJeH+MQaqQ9
	e60dHA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43gygdsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:15:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3662668b825so9613951a91.3
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591705; x=1779196505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gviVp5L7af/O+n1zHDTS+kpbHcxMBQWZhNHMsNPUGw4=;
        b=OsJilH4/zLhSMozkRhoFekge8HcJrXQFeTgXE5w9Eccekm/SMQOta7Cz7BDEwAEFuU
         neRqgxOr6hpfhWR8BxGM3f2/IMLZWBXGnzVTjP5s6E85jB9vYA91dvg7WUXejkDisy5X
         Bz0FwY5vwRmlW/3B0IbwVdgLGWMU6VcRg2193Os6xYFvMxzj/JiSKHBtGI/fbDKmE6zi
         WtPq0hFmxPQlmULHv+ppUuhUbaA0PSq+CVhLf5Opw+wYWC9Tz897ZJ+hg9r6T/NxCUaS
         yzYDVvrAUuT54qY3Ztv1/XvO8CqUC0A/SJ7jN0T39Ct3XJks4olrXMYqaH0XboW0gHJv
         lYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591705; x=1779196505;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gviVp5L7af/O+n1zHDTS+kpbHcxMBQWZhNHMsNPUGw4=;
        b=PPXFzvMSw/RUsOftyTdNPvIiR6Du5aj/dnh0dtuolbyD3O1wA9464F+pG9R7GLAj4m
         zV81DcPbohENdbvBVneKDizBgko1mIwBaBr1pRDKNk68C5nzVlzpVtN9dW71/kIDFZjT
         ZMHBBP7LleQm/M1T/k8fSzg8TVJzNBM3HYVF42rDDi+h5nsec25kCaU47JEfXO3QGLb7
         f/ZCQkFyUPyMP7KX1qUIRpGe6y38FQmXIt3pDolUgvxW+k/0p/+9RwRVAb2lCXiQ1y37
         +h3YZWrGg+mIpVfVBQgMFlnIsZgRdugLgArPMY8fzPYrfQgJt+nTC+twZsZQx/9nhqVQ
         MWog==
X-Forwarded-Encrypted: i=1; AFNElJ/3VSL3vduBVS+0RwSYRhBR4BfS4jB7hoAW9gij/xpSudvGiZ+xw6f8NhI8/glm0XDEA5O9B2z5sgxx@vger.kernel.org
X-Gm-Message-State: AOJu0YzVJzRx/jLCP5pgDURVMDSA4acvUYo6+X4JlRUZ1egLnUvb6uAQ
	3ZtOFcTnwaE6VaI5rToIaG1WrRo8QExelZSpaJMTKB7zBInrUSclP2dA588TGK2AyTkjc3U+k2g
	pCvu6Bma+1DpwB0pb7SPqnJA5urLgORbSy7CHDhYpmzGbY4CtWeOV3YOIGEpVgS7S
X-Gm-Gg: Acq92OHzjC3TWtO/33D8lY8UZbjlmulsYv7Ae+MpeR096oMiB6kzI3v3lesZGdHXqfZ
	iLQoqy66wypTT9BlwZo9UgRlT92bEdfyPVsnhVL5misIHv18HbQQuDTvF6gdvhR0B3kEVT4esyx
	9gmIKZMueRhLCERODvzJ0VROp3TxbuURvgqVQMJQcgMHF/qMc5mCJUmVloowCqNVL18vPuJZH+c
	Cll6v+BFJxQnnkO5VL+JViBZna4sKNRJ0qZpnmXhXESVw4ig+26uI+jem6tjQAeb6BVt/27bvOL
	ek7yExFbsjdlIhZcjFNFwWUS2CCsii0tJAdsaLQPr8hs8dSgnqLH72f7ElZ4H8X3bcniu8QqKLi
	MwXSMEadWya4YQ/ArpgrB
X-Received: by 2002:a05:6a20:a106:b0:3a8:21e0:1ffa with SMTP id adf61e73a8af0-3aa5aadcc7amr31859346637.27.1778591703015;
        Tue, 12 May 2026 06:15:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:a106:b0:3a8:21e0:1ffa with SMTP id adf61e73a8af0-3aa5aadcc7amr31859283637.27.1778591702425;
        Tue, 12 May 2026 06:15:02 -0700 (PDT)
Received: from [192.168.1.102] ([120.56.206.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267726df6sm11812694a12.28.2026.05.12.06.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:15:01 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: bhelgaas@google.com, lpieralisi@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, cassel@kernel.org,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Sai Krishna Musham <sai.krishna.musham@amd.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, michal.simek@amd.com,
        bharat.kumar.gogada@amd.com, thippeswamy.havalige@amd.com
In-Reply-To: <20260427121227.290604-1-sai.krishna.musham@amd.com>
References: <20260427121227.290604-1-sai.krishna.musham@amd.com>
Subject: Re: [PATCH RESEND] PCI: amd-mdb: Assert PERST# on shutdown
Message-Id: <177859169720.27951.14088072881655680010.b4-ty@b4>
Date: Tue, 12 May 2026 18:44:57 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=fMAJG5ae c=1 sm=1 tr=0 ts=6a0327d9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=QuRtzvr4xB5J0le8HPcEzQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=Qp5ySmTnbtObmzP82KMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 1GE0kRpOzf22gB2V6d_YSwN7oBH4Tf5K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX382WdsOtHoqv
 w2UuRkaVsDMwT3dsG0/9e5LDabp8W7rtfWKZaPEIA8rbJGEXItXbFcTYTXJ24p4GJjIRvHgJtao
 YMaBPS+H0nm2DBUZjzteOJuyq/N/upWin1soKlXNgaeBTZmVNgg1/DqLOulh5Jmx5FDQfFiLz4Z
 DnaMkQF4gWL8eHsZ0Xu6Ezm3ougWf+olM6vZP5Gvyjb2RezHJdqIxJAwqhL5DKDI6qprRhemZ51
 R1L3ESx/PvqNAMY8LGhfLbBxuBB+qOSfTyXNTm3hddB0RBmAg4jQ9r4LnM+bWr1O3xfkLXmNXSR
 /T+AveKn0q+iv+HgmkJ3/TXDDCbThAQ6P3inYM6hsGCjfV0GjAPtePHCEFs8AjedeutJbnxERms
 XExFOVIt1e0+wP+0tq/l8xfwEH2ILsEcB8SqLTbZtibywD09EU6EivW4oNQm9T83rz0d5iZ8pdk
 pEf0xsXviKZKm/l0lJw==
X-Proofpoint-GUID: 1GE0kRpOzf22gB2V6d_YSwN7oBH4Tf5K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120136


On Mon, 27 Apr 2026 17:42:27 +0530, Sai Krishna Musham wrote:
> Add a shutdown handler for the AMD MDB PCIe host controller that
> asserts the PERST# signal via GPIO before the system powers off or
> reboots. This ensures the connected PCIe endpoint is held in reset
> during shutdown.

Applied, thanks!

[1/1] PCI: amd-mdb: Assert PERST# on shutdown
      commit: 0492461a0508d88f2b63de4f7f4e71b38078de20

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

