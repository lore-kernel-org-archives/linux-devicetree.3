Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8835E3DB327
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994491; cv=none; b=uk/HVolTeH4Z0Irl2OmNau2VIPlSXLc37gPxQHMo9wyu9OGF3NlZT+qGLE2izhMp/mL3Do5fI1L6ZA1j3+jai2YORgn5wnmZWz+tp/mvVXJVw4icO1SV+Ge0owvNL71aOH9TToqjxOc9caLdGdf2q3gZaWvLTX7LMelmXQM9qgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994491; c=relaxed/simple;
	bh=rXPxWsIC0j0zVW5eD5YHYqn3764rN12QzF9i6j7Ck1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dK5qvnMK0fVxKa6BymXS8YBv5aZKAworNbu71+tXOVRNsMizBclckrmD5T5AfXQmL1v4850JIoSpoms8UM5iG23FS7wMI3hjoZ0edENMd//p6H1Dwu+IjL+lVHEn21lPyDUc5FeIuXLTu8s1vkKgFvMaYDWlPituJuoViAwRlTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jq+vs0MZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4bQKvbv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jq+vs0MZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4bQKvbv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbQ5m3813076
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D6aIP0TjEoFh9Gsz91ExeYEYlJZ6Di9/dXoT2DgWJd8=; b=jq+vs0MZYkXhx12v
	ANzIjiBHTtI9EMfDXpohLhURQ3zpZsArBrZ6gj1N4tFPMQgrRC3dG+Hhl0N4/JV9
	J/FrCeGYZIMUlY3r4PlTSjhSnQgy4t5FL4Q31WMOLnbxLvMnSYpEIO/kLKxOSFMX
	8sdajDgct/zI62+leqRY7QULkMWMV3VAPUwDQes75q9tX26tulnjNf/4DzTfNcxi
	AFyvuuMi6O4ww/+eg4YfQTuKY22MAc2sPtnM0JWpaX1yJ8dMVWZCOqo3v+qNY3js
	70wF3SrRudbaxUKPBPqrBDhe2qAydrb4O3U5B7oDMjotfJ6yD9DklRJ71ihktAeg
	jzad6Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u2fes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:14:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9178ba8eb30so10441046d6.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791994489; x=1792599289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D6aIP0TjEoFh9Gsz91ExeYEYlJZ6Di9/dXoT2DgWJd8=;
        b=S4bQKvbvy8+/BDt/o3qGqigkVJ8rf0QGVqm0X4vhFb2uLBY+EOVn/RmY3HrbwCV7o4
         OCsWgSd30Vh/XAVQlVm9u+QTSootjlftCYGZXR1G/hrW6TZCbKzamiTgWiRQBsxIaEzf
         T2pnUUMJOHNBZ7yZbkWzsAjZyqZWT9S9t87MCLD9TomH8nqiELwasbIPM0RApbL/dF+v
         9ZpOj5hPqbvJwPIQ7qxeVjns298VPKNaMk/mmyyOAJyexGIcdP6JtT5adI7CRCKIls3E
         egGeBWFAIdCIDa9n4FH7tTB2ujPNtLv3KvxRq4GK51VbkXt7qlkg65UfM2qNhyRGeDsh
         bFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994489; x=1792599289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D6aIP0TjEoFh9Gsz91ExeYEYlJZ6Di9/dXoT2DgWJd8=;
        b=nGvZbbLXvMACv2SRvWkKsp1ljSFUbmMoaCQKaKj2It9VDiC/Jn6fUj+DOGSbvVBPGR
         lMQwvoav2jAKGDw47gCH37uEy7hZ7Lasm+xxBO+YXSbUuNGcUNzGx9tx2t866W0Uc1G5
         d508AYcPTxxtwKygwFerXqpNM1sXjEHanUkyZoYbn/wQ1u3nDBNNG9j4x0PDaIQ4lFMZ
         grIg6mD8lAs59hzymjhsNY4EhESp5T4zXP6jUNyuQCiqpJMcdjdRvqFlypz8DD9RGA+T
         NdyDBumY9MkhImP34A1fXQmjPXtBAZTCLhsyHFhdMNed2J8Kdf0sN6KFe+pio8rtDF1R
         L0mQ==
X-Forwarded-Encrypted: i=1; AKwUvByXZdcL3s3U2HDPZdTl2vtGVaJGP499KYjduBmWEN8fHZHAeWCHT1yaZgYrYy9UNpVNGLl/dKKh3uk4@vger.kernel.org
X-Gm-Message-State: AFq9FYIo2ADCkgWA+GRE8f6fuUz9h7+1Z0sz8YO/roERMmxisHeeX6HF
	D+XURhyMC69wH6z+3XBe+4oV7Re33KwMftW6rN7KE8YNyxQhn3NqQCO9j/fByfWhII4U2ytm6Yj
	R8+xTA3e5fNQUaOq0+p6adZV4dWeeGi7GGJxm9GzZkKQHUKhwYhmvvgaxzJl72VrD
X-Gm-Gg: AYBFou0RjQtlNg1NWAKf3eHuRVfN+E1MLY3vqMLs1iAn3grOZKwRtCh9hrJyNpwVjTD
	yflZmus+te0I5p5rVMKIHBJu6SCzGaM/HNRxH+vp0vHJ3GXXF0DiJoOWbHTpjYm+PVEdXs9M25O
	W9QJSuZHnjLDT+9G9RdjEOH73EbxBW9kw7RpxyYRukZ55LVgGRqtJR/Y6nYUPoIEDh4AhJFQYfz
	LxwCa4IBAZ2ktFjTwiynf8t06ZlVyCuUWiM4pyd0UlACzZiBKvMLJkO2U3QdxoFTsykkC2K4Nqf
	RDoUXNCwwOZjrOphpED/utCgNDELzpWhrSQJdaGM0QZBNbyyarsOKwqJ83ApWIibcND3eIK553N
	slx2/vYBHnlfWwCOdULNqeA==
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr2745447685a.5.1791994488667;
        Wed, 14 Oct 2026 09:14:48 -0700 (PDT)
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr2745441985a.5.1791994488098;
        Wed, 14 Oct 2026 09:14:48 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda043cbfsm2141866b.55.2026.10.14.09.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:14:47 -0700 (PDT)
Message-ID: <3d8158f1-8c26-4866-a318-abaad47f75ac@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 18:14:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/16] OPP: Retry failed default single-clock
 transitions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-3-3041b788e9f7@oss.qualcomm.com>
 <xkiu74kv2biofdix25gimmxxzqfqyocsq3wvdriqj7zscpynv4@us3hib36vops>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <xkiu74kv2biofdix25gimmxxzqfqyocsq3wvdriqj7zscpynv4@us3hib36vops>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfXzRmTIHESqu9G
 Mt+Qm4TdTyS2wX5l8tV9JT4G6wrOwJP3HZtTHyCWz73cGkpM47arH21ZYJW/AAnmE0vQ2yfHwSG
 hhKQYSJmt5rNlfS0pNt0Mh2HGOKGpg4=
X-Proofpoint-GUID: XYs57NB3spRIM5LJKPAEh-WLXs0d32QF
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acfaa79 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=tSyx0q1tghd3iirTVWYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfX1Jc5/VFC/FA7
 C/WIJYmqwm6UuLcoiDG6fPcbIH+R5WICigH2HRpY6U2E/xBedOavb1UiILdkvYpFF72vaGJqZ3Y
 cqbbckgguLBqhjmRMJs3VPTFIok+TqKoyOekLhEhq0V3GMzhcMxsUuktjxxerJiUId/btLYZXQm
 XZoS1EXOAK25XZ5s3ce6IlWKAY4uCqcq9TIwE/OkecFl69Va4KuDy9HSx7ua1siwgDMFyK50V0c
 4cEEoo//DLnJOvr4Ja+/4RUhp4ECX8aQ7YJDc8oAJtIdmDi5jm7LOnbqUQZjXYHYrrU2DIyfkMr
 h2wyv1xlpSKz4Xdep6BXkmAoSM/IlkmqyMPENc2sJUOzlKqZOVSHnoNX5wabgsPqmpdcnGGePdo
 69NuZfyUtgIfwnrOtO6do21gdv7TGrrXRXRgqOiZgvOU4oS3CoAn0crZY//2m/mEruoTkEWgAoO
 TltB8v9K6Qbw6hJGGMA==
X-Proofpoint-ORIG-GUID: XYs57NB3spRIM5LJKPAEh-WLXs0d32QF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140064

On 10/14/26 3:35 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 02:19:03PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> A failed OPP transition need not leave the clock at the last successful
>> OPP's frequency. If hardware changed before the error, the default
>> single-clock path can subsequently skip a necessary retry because its
> 
> What is a necessary retry? Shouldn't it be: try, rollback if it fails?

The failure scenario is:

opp-table {
	opp-400000000 {
		// low
	};

	opp-1000000000 {
		// high
	};
}';

1. The device is running at Low. OPP caches 400 MHz and the Low OPP.
2. A driver requests High.
- OPP raises the voltage to 0.95 V.
- clk_set_rate(..., 1 GHz) changes the clock, but returns an error
- Assume clk_get_rate() can report the resulting 1 GHz rate.
3. The transition returns an error, so current_opp still points to Low.
4. The caller tries to recover by requesting Low again.

Perhaps I should have included that in the commit message.

Konrad
