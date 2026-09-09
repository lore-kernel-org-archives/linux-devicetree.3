Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9819049CF31
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 08:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944152; cv=none; b=FEYAGI8JeMnx0Y66vFtP4qRnjrpDSlFWxySH4/wqF53MjfoaSwDEhVAB9Oyqjs0VS18NB7xgXPM9rp1vNolL4a2dO5IkLooQQkzYvEDaO5g+umlXqF2FpQy5CCeu8akZqc5bTUH+GvuShKNQB9fmxXpT/3EB/EQFKrVq9mRFX/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944152; c=relaxed/simple;
	bh=ekfTgZTjlFd+mQavQaOQcGDH0Ikp6wpgcl0VhN4s9PI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aHMpMSnl4eQkpXRwz7EKz+5ntXNri2R2D7yAnkT6W2a5G4ACcGcl9xQ1oxOCyiOWgKZeZMYQCpYEdf4llQmJX32BgsVXquuLvTtfGtu+W7vQduFB8qbG8jCXf2YNjzc4TfY2TWa4cH9MkaUShqJv4TbgbxGI1VaZvFFtu9hZwUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B8HdMo6p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DfcaeGMN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B8HdMo6p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DfcaeGMN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6898Zfwc1189208
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 08:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ekfTgZTjlFd
	+mQavQaOQcGDH0Ikp6wpgcl0VhN4s9PI=; b=B8HdMo6pPM0FfsNcfA8zJmmRqGb
	kbM4F7xoNOmGXMjMKFTCyqnG6RRkLjF5MjcgR4BD2hvj9+khw1nprsuKVfBCzPEm
	/nglfqdnXrGmhxFntGw0u/kOxJzj8cImy+91NUsyGnq8xZzK3sjKLbf2lwCdgC85
	/ypfr067+Uk8bjZjI+9TvOqikjql5Cnfg/UoBlDOBWaTNjio08hiLS+MKnUXacBz
	VjTaNp2aO/nYOYmuzStR9iE2418uCM3+STfXUcdcKBEa3x5833qpJW/8Rg2jSLxe
	ltWp+GEFlWopLfFqXvdwHsVFaeY7y3GXxAnu4UHZI6kfn3CjueGupOfxe8w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjxtm1cxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 08:55:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b8eb84685so492063a91.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 01:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788944148; x=1789548948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekfTgZTjlFd+mQavQaOQcGDH0Ikp6wpgcl0VhN4s9PI=;
        b=DfcaeGMNBY6z0YtXJx4y1uftIud8zt27liHIbHrjMdnTQjqhn0GQdzt6p1Za+IU4sa
         omf+Zl4ILMyJlKumKrxbhtvTJh5JPhV+cSiHCxVPCZkZQyr1WKWWI6lJfK/rAsI2kne8
         YX5DwBfSjWeHfCgA1uCQYDG6arIAIrNHByTPwHilghiGMUP5k9YVjrHgiqmnwr+8iPRA
         BjasthnRVoSLPSQeawwYl+46DHRDTKyzXDmN7Kp5jMRmCVaazD7JtMogipm++VZ8VlUy
         PzfvSgzkmkM9kRE80/fwDzy79ad0tPb1h8Y9rGwsDj5u2nlPC28VCtJ5HjwXsjUkfA1L
         YcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788944148; x=1789548948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ekfTgZTjlFd+mQavQaOQcGDH0Ikp6wpgcl0VhN4s9PI=;
        b=lFdnI9fB1orIh+TbkqSuoIqeXPHNVCbyFW6IlheAoAR6ylqe5XlqO78gGos46oRLoM
         I/631GzkJBEdG12Kfgv8TxDV+BVhUWCLbZQk8Wreh4J57AYlo5bbrVBs9BX3ahKiHES4
         zDF3wvOrxIQYufAUh/BkeoyZSy4W6TR6BMQp7oAc5y5ozY/s4UN+1QWasndlDfl3GMdr
         coopYOJQebBrorSltFrx7opgCRSemiHsbTHX7yuNZTTDlKXd0inD9Zc7YWxHTjq3eIwL
         livA2zvw8iGgsUBgGZRKpIi4ZqqadEOqHE7RGmYx07eGv1LcS6Rqa+pfdouXyD2W9jln
         NGsA==
X-Forwarded-Encrypted: i=1; AKwUvBxhnpmvyMndWX2GPq3Cf7sWGpmfgeEsWmqBKsojtOIyiGCKxepsWgQnqtGt36XcpeVJlZOXQC3ho9lz@vger.kernel.org
X-Gm-Message-State: AFuF++lsbRF39v6a6EyNpu22lu2atXojpSqsO9Wo0Up0g35PQcw8Vvys
	tjIWRZKtcTLR9XA32U5w656cW7vVlzwU3ZNPkDTj9AAyMQJgmoE86543bDYZRLxwntTdKl+TCqz
	yfbQskiRuMi5tPMnJjf0ktGrwlkNDTgbvfuPC39OO1bPovXoqPAwtiaeN8Ie2Zfjx
X-Gm-Gg: AYBFou1l9QKR6AomOk1+N1Adp/3rkUJ+RPQRLDqjp4SLtE9jGHWvsVmbkRom6SJWjAH
	L8kxyM/aVaxdm8YE7LDrb/fNWrMBRdANWLRVXMWCzAKWBsDmUn5bsIsbzDEkh7+jh2LSqLG+iZ0
	LoZZEwTYOcXOz7Zz9miC6wErs9pCIB2XuMPrVfgn0RHtbu54qJn5eX7YIv1A04CQCHnrctqx4ip
	u3cyy0OT+PeK5qguzI8gUbqnJ8zyxe6Z5Zadyok1hKV9fk3623jBFtz+hR/j0TzETGHIXvEBS0G
	7PHAsS62BKpGrEey5LuTf2EdXcyIfhbomPQ78/8GW6koSqzAj8urHxotrnIShAR3iD1BgJj9/C6
	VNw/Z6c5B3huWGmn2ip+k+IU=
X-Received: by 2002:a17:90b:1e04:b0:396:463e:2eeb with SMTP id 98e67ed59e1d1-39b264b24e2mr31740175a91.0.1788944148306;
        Wed, 09 Sep 2026 01:55:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1e04:b0:396:463e:2eeb with SMTP id 98e67ed59e1d1-39b264b24e2mr31740125a91.0.1788944147853;
        Wed, 09 Sep 2026 01:55:47 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3397d6d1c16sm4496919eec.13.2026.09.09.01.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:55:46 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] arm64: dts: qcom: Describe the PCIe M.2 Key E connector for Monaco EVK
Date: Wed,  9 Sep 2026 14:25:40 +0530
Message-Id: <20260909085540.185221-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com>
References: <20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5NyBTYWx0ZWRfXxKjUcchsK+zT
 aIgXYM8KYFp+AKJ12Wdy18nXP4K4ULQ+SWMfO5IQp9LeNyo+R2njVh+ZzFI0pTBpRwUdQqz///8
 Y8jgpeRAHT3MflBvI9f97m8OKS1Qzew=
X-Proofpoint-GUID: 0ZJ7qm_I6yIrfQ-pbEDwcqCbrsjLHJOK
X-Authority-Analysis: v=2.4 cv=F+1nsKhN c=1 sm=1 tr=0 ts=6aa11f15 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=_XwftgCmqnCmiCopI18A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 0ZJ7qm_I6yIrfQ-pbEDwcqCbrsjLHJOK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5NyBTYWx0ZWRfX86557E92We1v
 jsZkSY00W3gVsMYQkbY7WzNaqKI/Mfh2Hosghf6QZcfNUPjPSKmPX1f3qxmwC7XkUy1XbW/cR3u
 g6kIFhRKI9ixeXec3q/zUMjTfaDPkchu3xbNKSKq5W6aNyt+ZaenIEu9azO4gbrlIm7g7dX7Out
 dTQxfJwl1LcUxmhD7k1VsvlfUrXo35kMxkyHxz6wQxt2/YHqsLNTZAbeiEozKTcrXs4uywF/mLu
 SSjIn7da/u5IU7pHfDCn2oNIX0n3GVsJP6zlqfGXsAXsaAOyWdGjbg6EUVkN7kSms51WWAzGLaW
 4k/2DSc69gOlCcK7DH4HvZLAl/JSgcf8Gp9Ua9//jrj4jL7ECMzGKe6RQL39B2wNqiulH/YqSpg
 Vbrb5oQGgIyAvtGOfZuQkcqdQndMp+OTfQy7gWU5SOdToqRTTTmiuPYR8NaLx4Fsv2JcFnWfQhW
 r6sJeSTPoBlHOsDYN2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090097

Hi Konrad,

On Wed, 19 Aug 2026 19:27:31 +0530, Wei Deng wrote:
> Patch 4/4 moves the graph port/endpoint anchors from monaco.dtsi to
> monaco-evk.dts. This ensures of_graph_is_present() only returns true
> for boards that have an M.2 Key E connector present, preventing
> unintended pwrseq probe on boards with soldered wireless chips
> (e.g. qcs8300-ride).

I reached out to Manivannan to ask whether it would be acceptable to
change the M.2 detection in hci_qca.c from of_graph_is_present() to
of_graph_get_remote_endpoint(). His reply [1]:

> This means, the dummy port/endpoint node will always be present even
> when the M.2 connector is not used. I don't see a compelling reason
> to do so.
>
> - Mani

Given that feedback, the DTSI anchor approach (which you originally
suggested and reviewed) cannot proceed without the hci_qca.c detection
change, and that change is not something Mani finds compelling.

I'm therefore planning to drop the DTSI anchor patch in v4 and go with
board-file-only port/endpoint nodes. The series would shrink to 3 patches
and no DTSI anchors would be added.

Could you confirm whether this approach is acceptable before I send v4?

[1] https://lore.kernel.org/all/isbrpaztfrgwfcleujrn4w26cshbi2mgn57tbh5bubvsegn6lc@jh3ab6htvd24/

--
Best Regards,
Wei Deng
