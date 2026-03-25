Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E78E3CF698
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439121; cv=none; b=cpEaOMoNHK+jXBvuKP/o0bB48RDHbZqP4FLnfW2tWJM0GHp4ikffC/cI+XNs5iJ0/CQTNho/6VS/Bi028d7ni9gzFaCpZD7+hGdcqxQuxYBqQo/UDYV7REWLT9WZR9OmgxxbBQcAfX/1monZaASM74KO2sEQVvKRVYEHhToZwWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439121; c=relaxed/simple;
	bh=VeDpg5H3Mu1ymhqFJARxM/ReOhJ8aSS48B4t1KpwAfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRFnoh/ntbQJseuCAmZAsJA+j5d5Qr9JS/cFKnsmwvStRVBuGMbwYAD+Nbrmbzc/u79YSWbEBXfc2oOpzA4qKljLbMBKcX927HVjv2cXeeaf47/5djaEvTyVLYy5SO5L++4eJrGGrbGlV5nIdJYqo/MlZ1mot0wq6VyLgRinreY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqDb8+pg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JmZdcbo2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqDb8+pg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JmZdcbo2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGJ4Q721528
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNU90VtVCZvNVrVMZ9CCy3RANpzV2GHcpjLzCXdmjpQ=; b=LqDb8+pgRIqCCE4N
	DmDsucvK/TYExS/xoduEj8FVcv5XkNAj8IfdmqbLZ4SquUd007a3IGYl0HtEuv89
	6r5YUJ5r3JjWZ0H9fv3TwTa0qbeIwUlfDmzms26b+8gq8NMkc2cz1NG/ZkAofiQu
	WP+9lzQsOJohWqFBlyTmHFQ8ppjNuRUx5FM0NnXaRRBjP3crHOAZZnCwUwEzWk3b
	B13hSt7E1X9jHQGg0Gp9vAJtSh+4zHWm0gyiZyY6oiPVzW8JkVetdZAk+Xpy/Q9w
	GOEBBlzOkPf0PBhsSgfh4oJoTL+jX9gcUSuiHc/yRHZnXozO8CoYtaubKVdkKy56
	i8ZK/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dm2rbpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:45:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4076dc16so31181401cf.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 04:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774439119; x=1775043919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iNU90VtVCZvNVrVMZ9CCy3RANpzV2GHcpjLzCXdmjpQ=;
        b=JmZdcbo2/CaZEBrhHECVSXeg8zg5mPh9rnUF5g2RkHaxCn/Oq6OFJLO6eiUGduQA5q
         bw+3uy5t09uXfr4CSXNXVmB0k9Yu+EtPXWZ6Do5f3+B7XeiWKbwwM+J0XOl8IBLiDuac
         cfEwY0NkUYkPCRbfKoQBqtNlZ2FRjEOOciqL3sE5ni32tFotzHSDG3SMT9bH6hK0U51H
         lhwxN9VcwL856js147ensZGw/mGpP6XwPyAIb5VCNR1A1IIm83dRQVrSGYZewIdZJYUc
         KdQp2p+mun8lwdQYRVM0QrYn21mui0lL0/lbV9pzYyPlTFTgDT/yC96Xl1xE64i+L+1Y
         RbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774439119; x=1775043919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNU90VtVCZvNVrVMZ9CCy3RANpzV2GHcpjLzCXdmjpQ=;
        b=ZYZhqc5Rx1T6ZMlcHbjaEL63wQ52g7/DGODyxYa/dR3/ziWmHhqfRnKYC5Exxy4Z9N
         YSfETykvJGtJlKJnSA/aZJav82mDszd3U6lrI+p7nYfPv+bp0Mgj8S/42MA2hwqKE8Do
         9WMVw7Q4e9JTdnILwH4K3joUXkBZfxPNLV/o8fVmwtcC+ok2cNFV8Ks4pG853a7sgr9a
         JJjwv1b2FIJr436Q76UEy129yZ1/gIcsbmjo9e2K0a2Ff9T0iGdjebQgZxg6mDJUCray
         ijO2Ietjmq5/hlZIRiSpLP7yrpNTQpczsbM3ciJODmyQqpnspdS2zwtx/S6fuH5emU2i
         ERQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD9JQEBiIYt1YjTjdjstn+zPOmMcLm9zeseVlviEZi42adtdR07nhgT6Lw0upkl15WMvP881ZXyjGm@vger.kernel.org
X-Gm-Message-State: AOJu0YzS8AijKqpn9Rm91NCd3BpUigDTYoDwpeZT+2CeWdRzrG3vxVEW
	A2un6PPPzOCE2nNsV4O2XdMBwvn7vNwVfPGG/vST74/RC7fc30bR6KfrDe3fNdAANNqgvy3k9TQ
	oR/RA0bF6ztN82ZaGJk4aqQLPCWZN5q7MghKycWafgabSDolHDeOmJKxHCWwhiynN
X-Gm-Gg: ATEYQzwpuWuQCKMzGmopgum6gPKV0zY3nzsQUy1ZAcTseowPzRFViNcDXviT0uGetWT
	Rha2degYRWsbAqVxdpLl8yPIEiIcZGA9P9ArKnLdGLUND85xQp7tKXO7r5cX+IeLaAkAfLDSBFQ
	ODgvV31YjZRnERdOqzl4NVw1SqXCN0LIlON/e2Nl4q3bYuEEQ+jDjrBN+hit+/OrnJ+yxKOS5kc
	kCKZ4W5eMsvkS2UtT6twHdXOzxNtBRWPemY/VLtUzcTxYXhH70bd5HxtXv/7JXNdo9bNjChaXya
	XfC4HoOt83uUiijs0bNtBekI2UPdFhumUdrzhMqzc+eatPMmXA4VopzWFNfLhsXNi9SqVauXS42
	T0+nPVV02AlngLeBh1QewhLSvABLQKTifVW/fV48r4804pghx
X-Received: by 2002:a05:622a:a6c2:b0:50b:3e05:5ed1 with SMTP id d75a77b69052e-50b80e445e5mr37759391cf.53.1774439118214;
        Wed, 25 Mar 2026 04:45:18 -0700 (PDT)
X-Received: by 2002:a05:622a:a6c2:b0:50b:3e05:5ed1 with SMTP id d75a77b69052e-50b80e445e5mr37758651cf.53.1774439117600;
        Wed, 25 Mar 2026 04:45:17 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4871a937bdfsm78325945e9.9.2026.03.25.04.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:45:16 -0700 (PDT)
Message-ID: <0f5de4aa-ea9a-4e5a-bbf0-58a18e644b55@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:45:15 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/13] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
To: kernel test robot <lkp@intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, mohammad.rafi.shaik@oss.qualcomm.com,
        linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srini@kernel.org, val@packett.cool, mailingradian@gmail.com
References: <20260323223845.2126142-14-srinivas.kandagatla@oss.qualcomm.com>
 <202603250417.fEMbsde2-lkp@intel.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <202603250417.fEMbsde2-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4NCBTYWx0ZWRfXyHYgn07hkbCh
 8Qtte7V2wv7hg6DbOxXPWmKvPnluuKBTzchD6wWIRO1XmaUyjsXyvZMbcMp4Wjw0YQ0ggvWyfEI
 oNq+ogrIrVE6+90eOfQozPggbjpF+gscUudtn6ZsTwZ/KtSXrn2fSAnC4rnBGC0IXJqXkss4AO2
 RWll+nwjNk+LACBxhGdm2UPVeWhMmUocG6i+PJIM1eSpwoiWev4JrsUvZllEmU47Gb+dK8CvdHl
 8Z5Roz45NEK69ZuA6g0dqOel7myHWXiLtR3ZRwuOK0WeREw8TSRi1oW+8Wlcv5C8ueWYcCMW02b
 1TCC0hfDCDfU4z0aCjiLP05CTiYMShNRhAqOPIdMC4w7uLIZqfrDE8lN4hByh7w0QrQkCf1+UDB
 OcYl/TdSp8suxIo1aLEV+FurOwU+CpKlZr1yJWh4+VO+3RrviqXyw00bTUDhgO/8K4v4xQ3wjel
 BRsKj2/cmhLZcps0qcw==
X-Proofpoint-GUID: g2cvo9aNDgMqZ3mUc9LL_m3g7IQ18zIN
X-Authority-Analysis: v=2.4 cv=Fo0IPmrq c=1 sm=1 tr=0 ts=69c3cacf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=5X_j558OWs3QqKC_3BEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: g2cvo9aNDgMqZ3mUc9LL_m3g7IQ18zIN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250084



On 3/24/26 8:25 PM, kernel test robot wrote:
> Hi Srinivas,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on broonie-sound/for-next]
> [also build test WARNING on next-20260324]
> [cannot apply to robh/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v7.0-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/ASoC-qcom-q6apm-move-component-registration-to-unmanaged-version/20260324-160527
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> patch link:    https://lore.kernel.org/r/20260323223845.2126142-14-srinivas.kandagatla%40oss.qualcomm.com
> patch subject: [PATCH v7 13/13] ASoC: qcom: q6apm: Add support for early buffer mapping on DSP
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260325/202603250417.fEMbsde2-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603250417.fEMbsde2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603250417.fEMbsde2-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    sound/soc/qcom/qdsp6/q6apm.c: In function 'q6apm_free_fragments':
>>> sound/soc/qcom/qdsp6/q6apm.c:321:39: warning: variable 'data' set but not used [-Wunused-but-set-variable]

Looks like some last minute cleanup added this warning, will fix this in
next spin, thanks for reporting this.

--srini
>      321 |         struct audioreach_graph_data *data;
>          |                                       ^~~~
> 
> 
> vim +/data +321 sound/soc/qcom/qdsp6/q6apm.c
> 
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  318  
> ab4c5c6ed2ed1e Srinivas Kandagatla 2026-03-23  319  int q6apm_free_fragments(struct q6apm_graph *graph, unsigned int dir)
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  320  {
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26 @321  	struct audioreach_graph_data *data;
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  322  
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  323  	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  324  		data = &graph->rx_data;
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  325  	else
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  326  		data = &graph->tx_data;
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  327  
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  328  	audioreach_graph_free_buf(graph);
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  329  
> ab4c5c6ed2ed1e Srinivas Kandagatla 2026-03-23  330  	return 0;
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  331  }
> ab4c5c6ed2ed1e Srinivas Kandagatla 2026-03-23  332  EXPORT_SYMBOL_GPL(q6apm_free_fragments);
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  333  
> 

