Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04E130FF27
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 18:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776189974; cv=none; b=rYC6ZMheFLWOuJpBt2mcHSI/Nw5n0DNTLpxlGO9+haqPnBtXJjGtpNCKAj2SyX3WIwjT5vlIzbAhpEm8IXlxJxA4ux/LivFFA/LPUC8CRheQWW93XpdbSLmub9WbrD6iU6OIK8JllQ7JexI5cTQ+Iba6LdjH+LNGdp6KLI1sdD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776189974; c=relaxed/simple;
	bh=u0nBbHBSgjgnpe0KFQwkgqOiRW+nhJjU3Glx/mx3NIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UM5R1twYE7LZSZgfLcxmHJKjrVRUay3K0uSklt9qjNPGr2Pu7brd6WRsWl7rYLBFXtqWCNeZxJnwHgePYSIDDqmECGl3CbqlSi48mMIFUKc5JOIhGU7vf65saN3igiyltuBquHHtADtdVpjGpSH477s7t/SD0SktcTT5RmZmNag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRd+2pRh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ALrKxw2/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRd+2pRh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ALrKxw2/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EG4XIx2005561
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 18:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Dwwpn3xcC7HL7EEDhxm6tbO+
	H/72am+MUaSViegCrSE=; b=jRd+2pRhRjy7HPPZo2mULsoIQ1BC1PLGeFqaG/LH
	9u88tPjcO9AywCudlu0GI5VjdFNtfo7ow8Xg32/OArVIoA5FgirDVqtv3YeMVuhq
	uAf4GKDbQATbNdC/qa039pHddjx3SNE+Scy/8rGHzI1ieXxuR0aEWazYq1NEfJ/z
	C01EPd9FL7ArNuOcDiomkYUFnPB695QINuJVjUTuOjeB51BzjjwbjGC7xLeJTJt6
	v5IbZg5nR7nNBM0P4Eak1G4EtfqQnB+Evyzq0V+KLMenGRTimPgwqj37CsPfT0zk
	KfGE6dJZFWbyKMeNhrvm6vZS6wZolCzOL8eKbwz6OCMsyQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrsjrghm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 18:06:10 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6101726c594so1212366137.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776189970; x=1776794770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dwwpn3xcC7HL7EEDhxm6tbO+H/72am+MUaSViegCrSE=;
        b=ALrKxw2/SuivKZMNeN1PhNT2yS5HNVggQki1X2v3D8xpiGOnhf3OqHHv6dNZ+yAxnZ
         XfD3bmxpNsWuwru0p9NlD5mxzZJGdvje4NXQJAmdrQVUvIx6+cVLBl9p8ELmjc4Tmogj
         7HgCTxmoEfegs/k3PD+iM/zLb5foXbm30TmGNZxZa459lzfE3jfMbRavLE7Ee6GlezqY
         WjB99VGKJQwNIPO6y7f+RRkrrml3ayI3n5O2O44YU0JMZMGYPoCrnOnszf0VIZkIjGpt
         S3dyNjb4aj27eRdxE5ZjBU+RiWCFvlp+Nr8ykwkaqgP3+90zzFabX7H/d/2iyWWmniUR
         ++IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776189970; x=1776794770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dwwpn3xcC7HL7EEDhxm6tbO+H/72am+MUaSViegCrSE=;
        b=sD+XyR+1Q0Qhgk05HZph4+Yq1TQkiNCSmxORNbRU8RPRRpVEjZ+BULsAfhx7PA8ba0
         ljNK3+1gyK2Wb6Nym1vUMqddN4pe96v5gquDnOmjJXktpweU2tbJuCH/jfqVOB3+tyo7
         TGPZsunoo1Ya01i5kqfj6lHdZ9n50qO+uyoMlypMeKv8L/BVqNd+pHq8/EOK5N3Q5KoB
         KuBSx1xmsnkiaq3RLnySlEMCv0QgdpXkVnWGYiqthsF0tuX8zBxqYzMjDj97+94ww7fO
         zffVyf6xZW9eCWLfGfGCr7sOXmGnt0DoAbRlJ3UqDmsmI7FWqzJz+XTjsKsopaHJ1EM9
         e3lg==
X-Forwarded-Encrypted: i=1; AFNElJ/a2E3JTDP8252I3X5hUF3tGGVc7HaetBQAOtDzMpG50bTbTQKHZnX/9AlZOpvVIRHqcDwcRuplCWlh@vger.kernel.org
X-Gm-Message-State: AOJu0YwwPwm1HgDrr2ITvA/wXXfdpxC32CJLpHjmZKSmaMMhI0BIrxkE
	H+CQq1ZaM1PAJzGfPsQCqqv3ZNZGmOuIBsdM6DeLLMCmwcATAH82cXFqtVrugUEWPidbEGsJjVQ
	ebWMpA9nI7rpyCSXXPykP9t/L54JM0gez26YIuIP1hWOpsEsU4HTtbVTPJetK11J2
X-Gm-Gg: AeBDieupWOVxRkiGO9lcfeUaoeuDprJWlpWLo/62qoZijvbeUL30h+bcsWCA6VEtuY0
	gW8Q/ffnG285In9hcdo/yuCuZfGuWzFRgger+VN2j4ydxyPAp5GxM/a7wggkuFVQXI1fawIHFSK
	EsevLH+tO+PtPS6RgW6ZDa9rLoMam6jGiriAkwZgkOJ6csktP5Dkn9cuRVuobYSQrYNRrgrPei8
	jBqalUGFNWVOhvf/Nw9dTgwv0HJDNFWefcNokzQOsuMM6JfTZ/lDPO0Cyjvr8tNUAVD5FtRwJxN
	Pe5SHnBwk8ob8ucjz8n4ISrLBF5UkyWN/2h/FfDot21uFRkfmmnnrzrYaFcc+CDYzNfJMfg0Jmj
	ARuEppyMdN2ocKiEwLeStyUmWOcquGhQtp6JVNHoVJM1hW/6VulAF1+1S/hl/SSU187AewWuWTa
	Do8UJalNiKYj4n2FyKjLdemTEzesL3LNM9W+gyUvAPlJGRyg==
X-Received: by 2002:a05:6102:3f8f:b0:605:7a45:c7c0 with SMTP id ada2fe7eead31-609ff3cc421mr8308488137.13.1776189970311;
        Tue, 14 Apr 2026 11:06:10 -0700 (PDT)
X-Received: by 2002:a05:6102:3f8f:b0:605:7a45:c7c0 with SMTP id ada2fe7eead31-609ff3cc421mr8308433137.13.1776189969815;
        Tue, 14 Apr 2026 11:06:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3ffd12014sm1259084e87.41.2026.04.14.11.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:06:08 -0700 (PDT)
Date: Tue, 14 Apr 2026 21:06:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 06/35] irqchip/qcom-pdc: Use FIELD_GET() to extract bank
 index and bit position
Message-ID: <mmwpjx6fx2zk7q6f6wxwjjkrwjx7wjtumxyax3zn2r53xkd7hx@v7rjsql3w4oj>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-7-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410184124.1068210-7-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WKhPmHsR c=1 sm=1 tr=0 ts=69de8212 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=nvp9pzcbjGLdG12YRgkA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: UztwXgGgoOeTnL2itX5eWg1xbZjlwMA2
X-Proofpoint-GUID: UztwXgGgoOeTnL2itX5eWg1xbZjlwMA2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2OSBTYWx0ZWRfX8jh8aTISZ7KO
 G9e/MC2pnp2fw9aWEUpJYmNOE51pL1ohZ+Z89lRWpXi7MLRr1AvhtiJJWsdRecW0YSeEpf1FqMg
 TcZTRbhPWl6DaNNkiUAe4w3fh0JUaY4PXFYKH/9LCn3HPvjkpeGfgjtzSwChspObkVmVQoxgQSF
 KDZAETv29NOW+0KD6B4zsq+TJHFM/vxhyUHsF+mp5vWhMvp6yhM83Z1P2tRvDEe2o0giqPjwsa4
 HgHl+GdOANFPlqJWsQYtd3O+xTNJ/wtVZj7HcuAd5QJHlMypdCOWi6EGn9v+zEtJVzqQ3jmHqY7
 5MWSnLFZNTkUr6DKVkZXXabD+vuhL2VMVdImdoCu6d+vICpu8IXtD/R7oXRQLzXf9VdCG1ggZs/
 ccWEksS9rQrqWMPVMK1oKHPAg2ogXl3NTU9ZuOHYqcKIXTEvSpljhHas7/kYYSQs4qoOpzw9M8l
 LLEmF9sGFF3JnFKF9JQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140169

On Sat, Apr 11, 2026 at 12:10:43AM +0530, Mukesh Ojha wrote:
> The IRQ_ENABLE_BANK register is a bank of 32-bit words where each bit
> represents one PDC pin. The bank index and bit position within the bank
> are encoded in the flat pin number as bits [31:5] and [4:0] respectively.
> 
> Replace the open-coded division and modulo with FIELD_GET() and GENMASK()
> to make the bit extraction self-documenting and consistent with the
> FIELD_PREP() style already used in the PDC_VERSION() macro.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/irqchip/qcom-pdc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index 5e1553334103..638b5d89a141 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> @@ -110,8 +110,8 @@ static void pdc_enable_intr_bank(int pin_out, bool on)
>  	unsigned long enable;
>  	u32 index, mask;
>  
> -	index = pin_out / 32;
> -	mask = pin_out % 32;
> +	index = FIELD_GET(GENMASK(31, 5), pin_out);

#define masks

> +	mask = FIELD_GET(GENMASK(4, 0), pin_out);
>  
>  	enable = pdc_reg_read(IRQ_ENABLE_BANK, index);
>  	__assign_bit(mask, &enable, on);
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
