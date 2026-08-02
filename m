Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9F426ED37
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 10:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785667834; cv=none; b=T4LRmZhm1QOQrxrdR1+G62/kT+PTW7vPD8E2etm1GphYLeNwt9fvCQlXvcuCayjBvEbFI8Wov1O1G/2eEaAg5atrGz23zxhUvzmVIlDcs8gLNQFueQQvC3XWeUEl/UWhvNO8BOzH5C0gI1QeCfjJyqdQu9HEfPM0JrfWvXjoRgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785667834; c=relaxed/simple;
	bh=Je6UYPtdW0cJqNgScuEMeybL+cKO3QLfoQtPD+y+9e4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VjIgAw1IbUnrCmwDm0yTt9OXe6obf4gEqZgdcU5He4bNgj7hFOavgZD8hby2w2CYVx4Ut4sKws9OoPzg43o1B9fqkTS8/pPzO0ioiL8ARd0+c97h5Oy+EOMJBbPZWlkv2o/qvjAYWWfXZaF53vIa5hzSIsCgNlNPzP/rosVCI2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4L0rA3o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PBQ1hKp2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4L0rA3o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PBQ1hKp2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6727llhv2271946
	for <devicetree@vger.kernel.org>; Sun, 2 Aug 2026 10:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Je6UYPtdW0cJqNgScuEMeybL+cKO3QLfoQtPD+y+9e4=; b=g4L0rA3oi6mKy1RK
	TOfWsX1NIYnPa+UgPkVTm+N1eFzO1S8y9fAhGZ3qFfPutHu9Lkbtn8L+pHtwoWac
	hBvXLZHPZYOuzykvsDtzghDEAMBJ031bFy93hEl6X91wgMR3rvCubK3xaHulTBbv
	a0E2MGCRbEm6ATWtlhWYpZvYZSL3gTW7eY+qVZazfME5Q0DHPBb/G0TJjz2aSgpC
	yQWE4cp60WgEuEOhkJ7DHsXUqnTxGYt2QBCO9CerF8wpxP3+9xVwzbwLgsVctTmR
	5j+U4C+miOcqsfEw77hS13OwU6plIVLgO7c0GOli4UbfXbPO+eP3qBt904pb9uDH
	ARYwAQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8pg2nbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 10:50:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ac0a54110so259907485a.2
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 03:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785667832; x=1786272632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Je6UYPtdW0cJqNgScuEMeybL+cKO3QLfoQtPD+y+9e4=;
        b=PBQ1hKp20MEd3BJn8iBghPjiSJfUFK30vqZG0wmGfQE8i7HFFfq3XlCKEZa4eCNh/n
         zAZprxAfyh0fN7XLVi5uhT9GWNhf0BwcemkI9G/M/d32wa4kIxoOqffwWVHQ0pwi7JuY
         dQngluO6hRdIfecp/xw74rG8BsT4eYcwHc7+WKT33RS3JfvOzu1058lWtuvAgkcsPP0j
         mOqOsEj0jMm9Zicb9oXP5zDkaPKNJqmxhEKU6HTM7OphvQy2al40UN3c5CCMQg+HNWPy
         gO51Uomq2rrZNbVFH9o7qLlVwfwRpNsii0pzMB/UX2vwg359xkFjDXO+y27e4H3rJJ5J
         X0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785667832; x=1786272632;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Je6UYPtdW0cJqNgScuEMeybL+cKO3QLfoQtPD+y+9e4=;
        b=Anlw3UOR+afo872X9hbYgkq5aVBpdj/AwGE5dyOGOKVDQF5xGHx2WsGtnfeMjTB/Ge
         eqw38pYk+RMGw9Mm0bNwR/UI/HnvCP9LNpjFJ+nSZbliocfKiw3ckQ640sJweI/bK/A4
         +F7oCoK+jadfd5CvIW+VmhUzLJQgGAkaJprmS/Td7YcBbd61fie8xWDDIB1t7QlhNgK4
         wnKBtHXlDgjaqtw+PFSc5f4w5fNr5FLf2y4bQiIq8h+bEYqyt9FJwiolfZF06aTp0j2s
         RBvg8AWMjLO53Rh2b4mW/RKUCbuF7beh0dbefvi0flB5CxKPNEPiPzXIgimtepGvDxu7
         S5Ng==
X-Forwarded-Encrypted: i=1; AHgh+RocFX2KxHcKG6CvMUqqewNMwwV/gExeaGSMVfhRE8gbJP2W7XKqvUOMQhEOWSn424sboQ+aEpYiWO3p@vger.kernel.org
X-Gm-Message-State: AOJu0YyzNh9Bf324QY8B/N0J8nhYgHKSfmyqbzYapKfcONn0ZiurrzEI
	nwu7/bzYQt2K7QfnVkBueNrj7m686qNB8ytfpfpNWwuCN2T/i7hGLQj+MsmGOlIgbLfHy6SCpA2
	zNatUXwx3vLS207a+dGpAVClaIP7KH3u+qWulQpWsOD7Fx/eX7ybQ1Yvx0QvMiiBt
X-Gm-Gg: AR+sD11LL8hIfa87mX9pfhF+DzZgc7p2bjcpwTh6lhb/1rNxnXztoK73sOED0T2+Nat
	8pkmjlRr27XN5fmG7YkFRcypiaLo/EpCOajsczUIyaYGQq7bSHHP7PPh0b77VttgpSRqkLagWeX
	xOBwiOUGiAiF5nqyxbYRuLyDm4HGjHjkkO3+6TtPlYx0hQTHhDUgLNcD0NUgx1IDdqm3079VrxA
	nFLnWRRKtok2EtM9olZgZk5CJsyMSaVk2T7QnHYoi1fPoTe24C/xq7ZY80qvEFW73E6lxp1KqkQ
	S768T45Pm46Jev/235JTy8h0OwHvayo6TARNNZb3+Ebo+CaJiZQnPGrpCEqAJQpdLfhp4Yo2liO
	OFK0ZBbsjiixrj1lGm6KB/dRsxgPuAg==
X-Received: by 2002:a05:622a:1e0e:b0:528:3b9d:2c7a with SMTP id d75a77b69052e-52b567784cbmr121528821cf.21.1785667831828;
        Sun, 02 Aug 2026 03:50:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0e:b0:528:3b9d:2c7a with SMTP id d75a77b69052e-52b567784cbmr121528641cf.21.1785667831358;
        Sun, 02 Aug 2026 03:50:31 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458ea4asm22846515f8f.31.2026.08.02.03.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 03:50:29 -0700 (PDT)
Message-ID: <b9496243-3d49-4971-8be8-bc4722a6bfaf@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 12:50:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] dtc: dt-check-style: Introduce 'stricter' mode
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802-n-dts-style-checker-continued-v2-8-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802090622.399B31F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260802090622.399B31F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: biA9IvOycLklHbFXBkVDGcHCVPNcBG4S
X-Proofpoint-ORIG-GUID: biA9IvOycLklHbFXBkVDGcHCVPNcBG4S
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDA5MiBTYWx0ZWRfX2RRD6phfA0qP
 lylZ6f9+6WjGkTTlTYMNrAjmb5EPcAg4qtuFeANmmpu39Ufn9mIIR8hdsbx0gGwKseUCrHTT8QX
 oj2mc629+6TAV2q539qFE3RvDAmdX2c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDA5MiBTYWx0ZWRfXztSSzFetqpsK
 iyHeiWXaMt7uhxxteyjmwZw7pGZ8qm5X+ay5cng4hAdqVq28tTRKs9QoRcZpeRaedlkdXVwaupW
 CBNoCdHQdKRy2KNj5XhH9DFODC5pMy3z1LSngIsJ9uoRBzs0DDjjJJB4oTo3nTgPcXQgWh2lfzr
 vqYXwAii3Xv8WsdC0+aN7Zz6kH27W6PTs78fpLRAVfbM5Q97qjGqTtruHB8tXw3twBMl23L7ZIy
 Z/5Jl/lcVxDZ6/UP8fH/zJQyxVhsh5zwhjCWjigU8apYo/f/iI2IvE2j4o1xq7SvFJ23jW4cv46
 HRo/0vT7pOLdyuJ4EdNv3TdeJ1DFJN6RYi9UTvLXfMW389MxqRKU6VCOYRBqfhJjSkKXj+lA5j9
 9Lx6jCy7/Jj0CXVCTtAWEvd9E+bNXcroKFvRM1R/ks8TANZg9kX23QlSpn6co5LdHLguBF0+qNI
 iMKrvasYVwnHJ2mFFAw==
X-Authority-Analysis: v=2.4 cv=U4Oiy+ru c=1 sm=1 tr=0 ts=6a6f20f8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=SvlgPUXKwTKBsf7v8KEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020092

On 02/08/2026 11:06, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The selftest runner `scripts/dtc/dt-style-selftest/run.sh` was not updated to test `good/` fixtures against the newly added `stricter` mode.
> --

Ack

Best regards,
Krzysztof
