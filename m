Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9693E7BCD
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177841; cv=none; b=IwQVl5pKUBMoAag9De4YF1udrEYt3KWac5Ej3R07F0QMC1bQn4PiLM4TPIVgBfshbXS48SUceNcS/6Sn1Toml7S0nQGW6elRL64I3BdawsKq6bMEQiMR60/IRBLqXfskpjrsB8VSUhF3S7fK8fRp9D7jh+GvI97Ok3NDm+9DdcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177841; c=relaxed/simple;
	bh=wxd0z1K/jMxfFNLgwOXIm4LHEBf7fMJ8Se4Mlgv2iBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GQwnnQLh4tuWq+9k20kfUHZG4RTWMbotMxzHzRAdssi3LPaGfegTFCfmIh3vIqA8XMO7yjKZ3+4EH2BbLUPVhI5JxYcW0KBIl7pvIJ45pYLHEdx/oD/NDSOnS6UDZIv7k9hi4BItWAzEWVq1Avt8yTbrhOHhusRPT496NBi5rvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hc4HJ36z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ixP5SY/n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hc4HJ36z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ixP5SY/n"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA0pBt303967
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sNFFQ8ITUaDjSLXfpTnELXU2+/IZ+KPg3CtsndZrQvo=; b=hc4HJ36z1a6qXvH0
	jMM2ZpIRPA8arwrba3dIz999binhr9pGCvi9ZWYazUqAiodNM5z75MMjecQS0GKf
	b0FlKmNrpjpXh1yNywIwz+MbbJ009EnM9TtSWBoqcTH29Cz9xbj8CZO+rtiSiF66
	JqYdtDkhVnzX88rdiIC//LqSCpSldaF7eTGQP9gxuv4X+DAj7m221sqlbl+4xbCS
	oiqhOPiMtrCPCTHrIW0ERp5GmEIGZrBAAhInGYHbpOuWveteUe8YsKtxIh4sMEZT
	+WGQmOk61lIdIzUKLkVUAnwBJLmAQpwgt5k0AKrPgmz4tJnNp1y6ywcR2AERb2pu
	94bRzg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqtb5gfmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51780e3ca44so15837671cf.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177838; x=1781782638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sNFFQ8ITUaDjSLXfpTnELXU2+/IZ+KPg3CtsndZrQvo=;
        b=ixP5SY/nsIlQATX8QGg9uMCh/W2FtQsUsnlJuT9KxOFCDfHzbkH8Sk787NdDt/Q+vA
         1HiHAws2V2vzJ0WAr9bO1StZbxHcFjtbYyhlbFXy4WiUIz+QNvRCMcXe9IfWKYBQKAVm
         VOWAYgD5vV9uEVBFRlZmffhR5fckhTzLU9S/SiEBew8D7u/5MofbV640MdRYqMcM7CCM
         Yjus9XxpaugkW5vKceqT8JbQc0XIPMFgMFdWbdfU2col7ZJdZt3onT5JWoiymilQdbOP
         O5UyEUdzC9tFs9rXL9nmnDtLdy4BVR4rQ/HmJRA8npN+K8l4BfJuSfqx4mMcZPGkQwKH
         TnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177838; x=1781782638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNFFQ8ITUaDjSLXfpTnELXU2+/IZ+KPg3CtsndZrQvo=;
        b=aD88MShnHQNxztbjXUjNlBpnLmV5F4VR/D9nfhepMsr4Z2y/h6V6lkurXlP8c85MLF
         5HHJW0ewTvjBz6Nqyfbp7EaBVYi6b/XDovVDdhDeJvmZxxHmEdSflPmOrKLpGXHnaTTj
         dftFLzZD+I6K4Hor+hxT2j/rn8CV9lR46lknXSnoKO45R+dbpGqhy8p3zR/PbiDPsw0R
         YQKMRmxiYLiQ5epp4VByilLjNZrodPJNYHHzXJPgk7+BdRNjJsSrHo+nnJPk4Us/tLy/
         1RH6oeudS9JwoDkCQZ0fCyLhvY21SGqoFg85AXKJ+/j4lNnHn3Wqs6K5tEMbOVKxgIeB
         z0Hg==
X-Forwarded-Encrypted: i=1; AFNElJ+9bBQazkgvSiekC2lWrY4jTD3rcPLV65Gxb2tcLOzsJGA6wPwf1sVk62WJDQgkSumlUjU43V0iorYF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1XF52e234U5mNLZjBoeaE560jmczBlv2gBkWb4q0EqZFFk6fy
	0VoNeuj6gF+NUjtoEA7iCaNPW+6/jHxJE4ETZs03dJej+OqsENt2SRAXv2u2oqAFumAURNyCuYR
	KVinKgMHXuhG1ajn/w/7euR6e6DD+CP2GcKjK1JwBrBfREOr4k+GzcfzTzK5PBClk
X-Gm-Gg: Acq92OGJDLWbiY9DeRh1KNyoVNjenJI0E6wDTR1ypzXlSR5qkbUtuTrmNGjchE+jiqO
	udmzWau+jAvh/zRA/YsLU9e2x4x1dyOzXV/qDh/ObkQf13RwtTLY0Wk3Ih/19bkmw2pAbflk6if
	pBABF4GaQ94Mlungu0/gQ0YBy1ixCAlJiSwjhydCIRECGenwarpOcP/JbWvC36DHypNzlQE6ws6
	h2yV/Jc1BvYAZDtRUC5VvQAH4HZUhK+B06kDkg6N767qLJ8cLvWRZPhwzpcuTXh+EtGht0fn6Zj
	IiQ6laJk57B0GfNzUOmIWd+tNbO3HSnxPXi0sH6ermh2K9hsWXP4X7r6DSL2DGvQBe8P8LZ832V
	ee5fX3TPp7amykMFdKKPCQZPT91KXjZZ94fQVgobprt2F3MEm0+gewdij
X-Received: by 2002:a05:622a:4d09:b0:50e:487a:bfef with SMTP id d75a77b69052e-517edd18bb9mr23051121cf.2.1781177838588;
        Thu, 11 Jun 2026 04:37:18 -0700 (PDT)
X-Received: by 2002:a05:622a:4d09:b0:50e:487a:bfef with SMTP id d75a77b69052e-517edd18bb9mr23050661cf.2.1781177837768;
        Thu, 11 Jun 2026 04:37:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f147e2sm53745066b.7.2026.06.11.04.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:37:17 -0700 (PDT)
Message-ID: <60b4b36e-8752-4e52-b5a3-aecae7986730@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:37:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/18] arm64: dts: qcom: qcs8300: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-9-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-9-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX7c7iZ3NvCEhj
 qeuuH7ybqxZPOnoX/2N7kWVC20viqU0/lhLZ2/vSUvrdUIzxQ0lvMZxVUPXOhAe0noHl/a35LXA
 P4B/QPcD2p5QWOI6zoIop9DdxOpRnesq7B30VQWQPx6tEGi9WNHF3IKzT03ZVYxpbjmcWrfLauz
 CqxEGacsftt25yVTtQ1517Bmkla4EQv74LD6cB2r8nyW3eIueILOBzx1MhDD0r7dYmj4BEsVko8
 VujFZl/ekoIErQtIQWMsusYp18pNonxoX/7ILpKO3t8YYsrskuJVNfyvaR/oouCssq8h/NQdLGn
 RHH8cq3ITTurvLQb2CWhp9wvP2mJ8NYgjR7xo+WQhHuPTwpyO9LMpwQmmt1V0bYp0vQHjqUPHOh
 g9HIZi0HIZaWX4chzgKiEQjUNtjU0TCJ7+q8NSPx8SkZKCRid7+Wa+IvnkMUzpIwLmoGC5We8TD
 3/cEyHB8Sfk+vh5quwQ==
X-Proofpoint-ORIG-GUID: 1HIk5vRJRNK8JSY5fEmpGsnPnSMwPv9a
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfXyUEqE0MNDpCg
 sSxjw/AZ37oAZniHmlJ6TMUterr4vd6+f8r5kUjDnnEdyDCjmensgl4NxU8VGkCr6LfmjNnRxLK
 36JMqT98GJ46Tq5Pg7LES8Tjm4WXWsM=
X-Authority-Analysis: v=2.4 cv=e6g2j6p/ c=1 sm=1 tr=0 ts=6a2a9def cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=EbZ0H_4aSGrsEeNKfi0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 1HIk5vRJRNK8JSY5fEmpGsnPnSMwPv9a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110116

On 5/22/26 9:49 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
